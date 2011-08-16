from django.db import models
from django.contrib.auth.models import User

from recipes.models import FoodType


class UserProfile(models.Model):
    user = models.OneToOneField(User)
    summary = models.CharField(max_length = 500)
    specialty = models.ManyToManyField(FoodType)
    
    def __unicode__(self):
        return '%s [%s]' % (self.user, self.pk)
    
    User.profile = property(lambda u: UserProfile.objects.get_or_create(user=u)[0])


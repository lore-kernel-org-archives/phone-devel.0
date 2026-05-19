Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0896F72622
	for <phone-devel@vger.kernel.org>; Tue, 19 May 2026 22:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779230177; cv=none; b=qnaH/bVg3f6B3bnQuXdIleSDJl1PBJuBYmii2CPLN8Yury0/ikHiv7wvVQcT90W1AxfneMSvV08BbXbj6tnhI13XgFXKSute9j36EAVjQAY+wFGfqYzkOdHflUAZooA+yMJ/0WAjax7Ijb2Ish6FaeQeaBPuGcRJ/SIWHmadAWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779230177; c=relaxed/simple;
	bh=U2rjwjEgu1WPX89yAOTMRtpmOHGD17L0X78cvHiuTBM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bOdst9Gb35fGdeXJ3qoH4rKThXXOqf44xwuKYafuwg51VULs5wm+X6g4Zcjz1CpHE7I4fcNvBvtLAvEV/dHvF+ZiJII6JTugfbNuyiNuwMn871aU8CI8rXnGpdNiG5On+7aiCNo1zNt8Dt8+UkrE5TuPXXS1m9uZQLi4eB0Q/8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=S8GhYjkY; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="S8GhYjkY"
Message-ID: <c0ad5424-3348-4b72-9ee3-13c8a050f744@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1779230173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T5InLOQdQoLkwGwEBuxJwIgvEno0r2Xq79+jyR3AQqU=;
	b=S8GhYjkYyhNAVAERJDudA7Y62+jq3HSjfRH/Kt/JMXQG5+OYz5ofjDlrTSb5eu/cv1qRxu
	IZdyP8/CtbopCxLuiBI6mx+ZTSBY+s9dLcj+lF6hbLHjtYqjP2bKK3474nTF7nhCfjzzC8
	/0zKghNXYOqu86AE1r+ezQXaHwmm7ykGOvTJEhWQyv6BMjWgjvmY7USrkaraIXwKSgaafP
	A7equWlAqhCOUnO55gqlDcq1BEKWFZSo6HpRwlQ7iKg5fhuQ32VWKdAbulgWZsC2Sk6NbV
	mmk+v2ZbiAlE4/7Ytc+EsqyBJXNj8SWNkrK5OqY+scSvXGICc5gbP+6bnXaang==
Date: Tue, 19 May 2026 19:36:05 -0300
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 7/7] ASoC: codecs: aw88261: make volume control usable
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Weidong Wang <wangweidong.a@awinic.com>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260518220906.347958-1-val@packett.cool>
 <20260518220906.347958-8-val@packett.cool>
 <97775db6-b417-4e07-962a-f0228684d7e3@sirena.org.uk>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <97775db6-b417-4e07-962a-f0228684d7e3@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 5/19/26 1:20 PM, Mark Brown wrote:
> On Mon, May 18, 2026 at 06:44:36PM -0300, Val Packett wrote:
>
>> @@ -424,17 +415,7 @@ static int aw88261_dev_reg_update(struct aw88261 *aw88261,
>>   			break;
>>   	}
>>   
>> -	ret = aw88261_dev_set_vcalb(aw_dev);
>> -	if (ret)
>> -		return ret;
>> -
>> -	if (aw_dev->prof_cur != aw_dev->prof_index)
>> -		vol_desc->ctl_volume = 0;
>> -
>> -	/* keep min volume */
>> -	aw88261_dev_set_volume(aw_dev, vol_desc->mute_volume);
>> -
>> -	return ret;
>> +	return aw88261_dev_set_vcalb(aw_dev);
>>   }
> This looks like it was intentional in order to ensure that things are
> muted until we power up (there's an unmute in _dev_start())?
Sure.. that doesn't seem required but I can keep it to err on the side 
of safety / keeping what works.
>> @@ -983,13 +965,13 @@ static int aw88261_volume_set(struct snd_kcontrol *kcontrol,
>>   	struct aw_volume_desc *vol_desc = &aw88261->aw_pa->volume_desc;
>>   	struct soc_mixer_control *mc =
>>   		(struct soc_mixer_control *)kcontrol->private_value;
>> -	int value;
>> -
>> -	value = ucontrol->value.integer.value[0];
>> +	int value = ucontrol->value.integer.value[0];
>>   
>>   	if (value < mc->min || value > mc->max)
>>   		return -EINVAL;
>>   
>> +	value = AW88261_MUTE_VOL - (value * 2);
>> +
> We're doing the invert of the value scale before we store it, currently
> the default value is defined as 0 in the header so we'll default to
> maximum volume which is likely to lead to some distress at some point.
> The default should be updated as well.

Ack


~val


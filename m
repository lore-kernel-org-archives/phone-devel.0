Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4772E262D0B
	for <phone-devel@vger.kernel.org>; Tue, 21 Apr 2026 16:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776787453; cv=none; b=lpsTFAxlux5n0gwMy6LFzNNX7sXwD5objA77WwO3us1cgUXbI3mm2CTF6k9gvRglIO4SpwJsvdFb/ZE8Gewxal4TgI7i8cW8Ok68JMpViR7+7yUXr05jMwNaFx1DGSgJkPHcv2469RTQ5bnu4UaS6L8JlIRKr3tPaN07rHevvAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776787453; c=relaxed/simple;
	bh=Bq0V1NMj7zXBpQ5Ls197Tq5GR5Ngnd9P4tpWuEwybqo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n624KRJl/Ma0YzByHecXRweTg2YKvl8Hb753wQoXWpmXX2jasVCuuQj4BaQqjYUu0/Q2154Duc0ZPzHzBQqskhU2wkLHY/NAg5ACP2QzJSagLVSP4jail6eyLZZr0QlaQCvkBH0uSGemUFC4Dj9169nryEFJVusqnHrqPw/mHmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=YWGYrxLg; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="YWGYrxLg"
Message-ID: <d9522700-3366-4a45-9a4a-fb226a7d4c54@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1776787439;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oeXv3VEKzYsaVqC1DCN7PMt1Ukyo8YmmsaELEDojHlU=;
	b=YWGYrxLgTdkc1FH4mG7yMxXa+2HJYyBYl/HnV7kRrcvLjHL/vj7eEW+mVTKPvHWYuoj0JO
	mzQgNVRON7KU6E5OyfQZzPdEajWXCCRhqJAHaff1lBr0bPS6swOdC7sVAtyeYcgZjehTkN
	q4fp5UWNeR8/O/lWu4xzD5KMbLUGJPwNxXZB/qYdGho0mrW5HwU9KKEOA0k/c7aBvykYqR
	2UaX8XlYF5WCR+8NEgCQ/FWfmtOxgYfK/4tTV7Yeff/ZgpEtfTzm696FNFC154lXAKm2S9
	7LriLneFanNMV8Bgv+N7M6v8CNVTb5J/ZfH4WneiH1UHESaWOh0+2zso8ID2sA==
Date: Tue, 21 Apr 2026 13:03:48 -0300
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] ASoC: codecs: aw88261: fix changing sample rate and
 bit width
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Bhushan Shah <bhushan.shah@machinesoul.in>,
 Luca Weiss <luca.weiss@fairphone.com>, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260420213250.215465-2-val@packett.cool>
 <ddd25025-74ac-4363-8be7-9d2c70f8e623@sirena.org.uk>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <ddd25025-74ac-4363-8be7-9d2c70f8e623@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 4/21/26 12:59 PM, Mark Brown wrote:
> On Mon, Apr 20, 2026 at 04:39:58PM -0300, Val Packett wrote:
>> The aw88261 driver only worked with 32-bit 48kHz streams so far due to
>> the lack of a proper PLL initialization sequence. Fix by selecting all
>> the necessary PLL settings based on what was passed to us in the
>> hw_params DAI callback. This replaces the strange downstream routine
>> that tries two divider modes in sequence.
>> +static int aw88261_dev_configure_syspll(struct aw88261 *aw88261)
>>   {
>
>> +	switch (aw88261->sample_rate) {
>> +	case 8000:
>> +	case 16000:
>> +	case 32000:
>> +	case 44100:
>> +	case 48000:
>> +	case 96000:
>> +	case 192000:
> ...
>
>> +	default:
>> +		dev_err(aw_dev->dev, "unsupported sample rate %d\n",
>> +			aw88261->sample_rate);
>> +		return -EINVAL;
>>   	}
> The driver advertises more rats than this, including 11.025kHz, 12kHz
> and multiples thereof.  It's unlikely anything would actually *use* them
> but it'd be better to update the constraints.

Oops, I never realized that SNDRV_PCM_RATE_8000_48000 includes so much 
"unreasonable" junk!

Ack.

I thought of updating the rates to include 192000 but I'm not sure how 
actually supported it is. The definition for it is present in downstream 
headers, but the datasheet for the AW88258 mentions 96 kHz as the 
largest rate, and I couldn't find a datasheet for the 88261 itself..

~val


Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DFF1B4F0A
	for <phone-devel@vger.kernel.org>; Tue, 19 May 2026 22:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779229964; cv=none; b=DQlOHOoVP0ST5GlketU9Z0EUHf0iCiVEuwQo92SUM8HJq/FLtNOpB1o7DcJF5Yj9YKeph/9CvL1h+XuUaZz70uZOaIPlBXX7MwLWK3qIqmVixiHVsd6JDA3a0przAX+HZT3XhE2UFvLCIHI8IOIpXhNhooEhm//+YXqPnWfMOfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779229964; c=relaxed/simple;
	bh=cAw4XGqjt3qv2sJP4e7z8g6naYXRHPCu1rIIaDNq1M4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QXSLnm+tHV2lB/5xthtoCTUw4HgTuauPRoJrtqTrmmhL8FRcHoYEMlcx5Oggxu3O465o8NRZeoGC9I/AgLXr9MDP36nv+fXPKbQ0Vfhz0PJzgjcE6mjgcA2wHbRgI6af7+W8qUZkt8XGnEZkEIXf/aKg0DVcJuk/rJcXfRGSyx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=XkpWbqRj; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="XkpWbqRj"
Message-ID: <ea7594ae-e66d-4fa8-af8e-ac790956e61f@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1779229959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BkHJ9n0RI5u6cnMM8sbqEmOYCyvryzgMUP8dlv8yY9c=;
	b=XkpWbqRjtxVyiLbto95EqSXwSNGaiuWFEp5QkjG5tHwcwEeCsrvTEUy+99qEEnwnZT0CN1
	OdkatbYq8n4GWkqBJ4kLegjcsJ724wsmhwuvZuMfSMpPaZa+tbeHmGbOUi5yp4lp9QJuZy
	YtN7IAavfANVHgo1vTsFeNezCpGdi9eddp0AtEdNOwGGpfnR4iMWRpyz7rmhwEHn3748My
	Z0otWvUjgG5XhtLyzcrxhD4BAe19nk846ae4RERDhr7izWKMfELcs0HB2bpKumx5figaGi
	x70+exK71iENFCY3HJ7JlXpcJilcODg3DQofSoi0FS4jgSHdT22sppg7iIEZhg==
Date: Tue, 19 May 2026 19:32:33 -0300
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/7] ASoC: codecs: aw88261: add TDM support
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260518220906.347958-1-val@packett.cool>
 <20260518220906.347958-3-val@packett.cool>
 <5085cba2-6066-46c6-96c5-aeddfdf3fb72@sirena.org.uk>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <5085cba2-6066-46c6-96c5-aeddfdf3fb72@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 5/19/26 1:06 PM, Mark Brown wrote:
> On Mon, May 18, 2026 at 06:44:31PM -0300, Val Packett wrote:
>> This amp supports TDM mode, so implement the set_tdm_slot operation to
>> let the SoC driver configure the TDM slot number, width, and masks.
>> +static int aw88261_set_tdm_slot(struct snd_soc_dai *dai,
>> +	unsigned int tx_mask, unsigned int rx_mask, int slots, int slot_width)
>> +{
> In spite of the changelog this doesn't actually seem to use slot_width?
> It should.

Right, I hadn't exactly figured out where that slots in (ha)..

The datasheet seems to say that I2SBCK is slot width, but there are only 
3 options for it (32/48/64) and I currently select the one that matches 
2*physical_width.

Grepping the tree I'm seeing that slot_width is basically the same thing 
as physical width. Should slot_width from set_tdm_slot take precedence 
over the params_physical_width() from hw_params? Should I just have both 
callbacks set the variable and whichever was called last "wins"?

> Note also that we should disable TDM if slots == 0.

This is pretty much already the case.. but I guess I should also reset 
the masks specifically to the i2s default (2nd channel to R). Are masks 
also zero when slots == 0?


Thanks,
~val


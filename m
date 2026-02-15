Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC3725D1E9
	for <phone-devel@vger.kernel.org>; Sun, 15 Feb 2026 20:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771186006; cv=none; b=DbN0NaMvMy3U1bUyJ4cFekY8u3t7c6a3snLEhemLRaF7UtNPwnjd0GiK6Y11/B49gpPDozLV0EQtrAcsG7XRSDnbWG/3j7kO8WOY5UP7ZN41ROIA4muFTDkFIkW4I/AxtYrAMzBH9x5YyPAyQlK+BrPEwA2xb0u1v44kuZmn2HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771186006; c=relaxed/simple;
	bh=fYY2Hcini0IYTBnNIV2OVtiPJDT1BxddgIIfefj/oz8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q+XixGQUd4yFMI5KwOxQ0VSt1TfEi67AmikDLpQTNDL9Oi4GMliQ76T2ck/ocfISUnQVs9mPa4+nSIIXGqS0MrV+xkucPUmNWmtSuCMr2Xm5rA84gTL2QpRw/2rYkzd7+Cbk/DtJvzxE7PbnRvCNPyIjtV6QQGRwNW3y1bw5q8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=euIf5QAa; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="euIf5QAa"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-79627af6349so25892287b3.0
        for <phone-devel@vger.kernel.org>; Sun, 15 Feb 2026 12:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771186004; x=1771790804; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ew684kZBC5j6NJc+gT69tQd+JtTITX1IRPbP6jdn/Y=;
        b=euIf5QAalD3NPiKAZWjzzPxTfCuOLSyQPRo1GquCnLZfFPwyiOC0UQiQ5BVyI2ZiGR
         ZHR2zdf78z6XoJZThdm2uIol4BdPcul42WloxH6zpmVCqaodxkX+jlx8M+x7DkH4VGEY
         /Ldxuug0KVeNUiawuf3xTVnEInuiR95aplU/2vulcj1GkD2K1Dw27hmxtRf3huW/PEIG
         GNWTjLUvuXt7uL3E/E3qmxpOiyeQfOGps7eJlk+T3ZUxDjdOzWqwtMjGg8ryJrOuucSf
         TzGP/WhT2LLssGh9nUa5JqFhw+kA3miYxFub0VUAN3yrt17pdIcXA6idoZB00nJkJgbL
         9jkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771186004; x=1771790804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6ew684kZBC5j6NJc+gT69tQd+JtTITX1IRPbP6jdn/Y=;
        b=FNiLm2wbjNNAOPFuxXeoxw897zvAGyE1gIwBTxwsNOLwxw0NTT/R3cvhmk6O27KPeB
         9xbDnPtQuVNaxdiwFHB9ZPvVLSv+G+OYAsmU6NquPKgCiyTD7Ocn28tcTM/MgPWlJMGg
         B41UQypX6mz4CtrjgXirhkafVrx3AiGygafTX466ozu1aBdkAdDW+7N9SS+RwIvO3kOr
         sT9q3rqCSYsBhTyLw7oWlUT+/IqnfSmkupIC5g2UQJYKdqyQM0SCuN3ud/KNFTRiRYtF
         mE/GyBrADlj4/fZEMfqXC946PQDhqw2IGMKF2TYaX8fNq1gaFdNmuHNd4OmhGb/aBc/D
         3RFA==
X-Forwarded-Encrypted: i=1; AJvYcCVk0eTwGVMnXbZT5bdmhJg85x1LqdxROYt7u6Z38HpvssjtSjSVc5CRbJlR9FLyp61zMsKCu+HAC5znCA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj0T7vEOghEtZdSnd2p2AoSq/diPyXfg5jsZhtuFSPMvzvfqKm
	ujHqP4CZi7rqnlZR/SFLJqc/v8lJq7mLVn2qRbFSRE7rSXV1HVbzVptz
X-Gm-Gg: AZuq6aJX6ZA22Am7izJD3PFjmGNecXjedNPxD908q8ZqTJOEQGfLlZVL/B2GydGoBie
	vCGYBupo/CJqQF7Sh1G7/KhD1DRdsfP0j0rS00ioFaTcVsqo4/D67ZiSqUca34HyuKhq8CJEhlT
	lLnLM+6Mf/DkGaR/E9y2+Fv1peTbFWUTjVrEwKEA4wapYZVAkNmkk3Wq/LaE50/cITcZV1CZ5d6
	kKFOPyk4+muxla9tZ4XYeTBIHEWmMDQydxQygUXbbWo5n9sfre+FbGcnahxjdfsusNXSSGqqhFP
	N2LwZ1k4swrs34mr6abdFt5DZgr/VolgmFrQnkUroa48U0mG70CIL+KD8sdu5hhFRkQ9ozd1T26
	/bMRKLrFbxXjYspjXdVGwHn9kAlL97aoMQb6MkhcxMZiHml1wZdM1mRhYhC4UIg2sMbBMXXqPJe
	zJeOegQFn9nPWX0mREoB0x
X-Received: by 2002:a05:690c:9990:b0:78f:a615:2724 with SMTP id 00721157ae682-797a0cca0cdmr147309467b3.48.1771186003955;
        Sun, 15 Feb 2026 12:06:43 -0800 (PST)
Received: from crusty-box ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7966c16f0e0sm93475407b3.5.2026.02.15.12.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 12:06:43 -0800 (PST)
From: Erikas Bitovtas <xerikasxx@gmail.com>
To: jic23@kernel.org
Cc: andy@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dlechner@baylibre.com,
	krzk+dt@kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nuno.sa@analog.com,
	phone-devel@vger.kernel.org,
	pmeerw@pmeerw.net,
	robh@kernel.org,
	xerikasxx@gmail.com,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v4 2/2] iio: light: vcnl4000: add support for Capella CM36686 and CM36672P
Date: Sun, 15 Feb 2026 22:06:28 +0200
Message-ID: <20260215200628.53841-1-xerikasxx@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260215193114.2a1010a8@jic23-huawei>
References: <20260215193114.2a1010a8@jic23-huawei>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 2/15/26 9:31 PM, Jonathan Cameron wrote:
> On Sun, 15 Feb 2026 19:28:56 +0200
> Erikas Bitovtas <xerikasxx@gmail.com> wrote:
> 
>> On 2/14/26 8:09 PM, Jonathan Cameron wrote:
>>>> ---
>>>>  drivers/iio/light/vcnl4000.c | 40 ++++++++++++++++++++++++++++++++++++++++
>>>>  1 file changed, 40 insertions(+)
>>>>
>>>> diff --git a/drivers/iio/light/vcnl4000.c b/drivers/iio/light/vcnl4000.c
>>>> index a36c23813679..1f8f4e4586f4 100644
>>>> --- a/drivers/iio/light/vcnl4000.c
>>>> +++ b/drivers/iio/light/vcnl4000.c
>>>> @@ -185,6 +185,7 @@ static const int vcnl4040_ps_oversampling_ratio[] = {1, 2, 4, 8};
>>>>  #define VCNL4000_SLEEP_DELAY_MS	2000 /* before we enter pm_runtime_suspend */
>>>>  
>>>>  enum vcnl4000_device_ids {
>>>> +	CM36672P,
>>>>  	VCNL4000,
>>>>  	VCNL4010,
>>>>  	VCNL4040,
>>>> @@ -235,6 +236,8 @@ struct vcnl4000_chip_spec {
>>>>  };
>>>>  
>>>>  static const struct i2c_device_id vcnl4000_id[] = {
>>>> +	{ "cm36672p", CM36672P },
>>>> +	{ "cm36686", VCNL4040 },
>>>>  	{ "vcnl4000", VCNL4000 },
>>>>  	{ "vcnl4010", VCNL4010 },
>>>>  	{ "vcnl4020", VCNL4010 },
>>>> @@ -1842,6 +1845,22 @@ static const struct iio_chan_spec vcnl4040_channels[] = {
>>>>  	}
>>>>  };  
>>>
>>> ...
>>>   
>>>>  	[VCNL4000] = {
>>>>  		.prod = "VCNL4000",
>>>>  		.init = vcnl4000_init,
>>>> @@ -2033,6 +2065,14 @@ static int vcnl4000_probe(struct i2c_client *client)
>>>>  }
>>>>  
>>>>  static const struct of_device_id vcnl_4000_of_match[] = {
>>>> +	{
>>>> +		.compatible = "capella,cm36672p",
>>>> +		.data = (void *)CM36672P,
>>>> +	},
>>>> +	{
>>>> +		.compatible = "capella,cm36686",
>>>> +		.data = (void *)VCNL4040,  
>>>
>>> Is this necessary? I 'think' if you drop it we'll match instead
>>> on the vcnl4040 fallback and then the access to the data will be
>>> through the stripped name only bit of the compatible (first entry, not
>>> the fallback so cm36686 in this case). So you do need the cm36686
>>> entry in the i2c_device_id table above. Probably better to keep
>>> this here to avoid having to reason this out - but perhaps a
>>> comment to that affect would be useful (assuming you verify my
>>> reasoning).
>>>  
>> After I removed the entry for "capella,cm36686", I received the "Unable
>> to handle kernel NULL pointer dereference" error in dmesg. And at least
>> stk3310 driver includes a compatible entry both for the device (stk3013)
>> and for the fallback (stk3310). So my assumption is that this entry is
>> needed.
>> I could include a comment explaining that cm36686 is fully compatible
>> with vcnl4040, however, if that is necessary.
> 
> Thanks for checking.
> 
> What did you get as the backtrace?  I'm hoping it'll explain what I'm
> misunderstanding!  The hacks around using the wrong table for compatible
> matches have tripped me up before.
> 
> Jonathan
> 

I am attaching a link to the dmesg. There were quite a lot of lines in
the stack trace and I am not sure what is the right way to post logs in
the mailing list.

https://pastebin.com/QgeTdNEP


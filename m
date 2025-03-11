Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3712E232368
	for <phone-devel@vger.kernel.org>; Tue, 11 Mar 2025 12:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741695750; cv=none; b=gwrxNL/UDKAHWkWDDne+bCL8oPuA1WrsOkwIPUZv5qZfxIDiBZ7StjmZ5KsAEdxOwTi5wvRftkFP1avWGmyafqGnoHe9vh6ggJENJSvo+lj7ObVurT3QP+w6ksmqmQvYhUSNIYA+67TC8eFfMUg/unoL81sR+KoKyZbkwuIEjPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741695750; c=relaxed/simple;
	bh=BO2rDpHB1rK6ubktCHUsRSb+c7GamYkrXTUiMXgVYrw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EjwONX8lef2qB6plbfuIjX17ZmRjMZH8MnglKDVaEifyhnRJeBWBeWe4yO8eFRtLafqWPn6sFRe+3R/KoK3lYp0uGNmtHYxVKgzlNXQBj+ITgVYKVb8+Nfrr8HX25sGqmXo//cLOYDpa8rMHqB6WJKlYJuhtWs62lSzHQvNMA24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=umwDyNNT; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="umwDyNNT"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3913b539aabso1772568f8f.2
        for <phone-devel@vger.kernel.org>; Tue, 11 Mar 2025 05:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741695746; x=1742300546; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RuRTdmTo0miGxQN5iUZvcytRHU1YTlQp0tIlh3ar5LE=;
        b=umwDyNNTJTqPsvOAdWRidI3Kk0+lbCzlq28naMq1jsWc6zR+TGEVH+X9ba9yDawsq1
         GrzE/SkKmPsbSAnaD3bAnbsdK+LT1n0BKX8hCDQhnMxuont6k3OEksv7arAFNgR+9WQI
         rqcoOb7oDn3N4rMES3KgU1j3/zJe9fCgvh6ykf1ncRIp7+MBzWbdvJSeuf3gGgRnEpoz
         hcD5mxex6Z8Q58WN8QRkqYOc2/ExzGMklHWp4MTUaCQ/R/kSCiQDMS7JIRmuFLpjxNw9
         7T/s6uj/cvGJ195Qb0iWHlmjehg7c3QC8g4IENFe7B4QrN0bELN4dl72H8PSo7DU6vxM
         sYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741695746; x=1742300546;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RuRTdmTo0miGxQN5iUZvcytRHU1YTlQp0tIlh3ar5LE=;
        b=mjz7osMVSqWGxqro5PkPgBdFAE8Lrv1+eFvOsBuRAm9URZXcnDzx6bMIQSJ34iH9ww
         6bCbCFq+AoQAM71QeRsU0V1Jfgalnn+2pF9oIYPEmv7sZ1nJR+0RpkAVftk/EF2a0EEn
         72GfNU+BxdDwMTJfdSwY9Z7G5kjrk+Pk0jiD9Ifq8U/AY/m9o0bRaIDL+Q9T5/LPdm6y
         q9a0reG58LMIJOQF5NhYmSlUTTL7Om0bLHEQ/jdb9BOIcEHlbZ3WYqptcVQnS+L2oRjF
         MNg5yU9KKy3YIOVJV71X49PZ3zQtKRsiY6qpRvBIqHjYBZohZg2SWGoTXZpsd2hYwtdS
         Odqg==
X-Forwarded-Encrypted: i=1; AJvYcCVok8CyPC27ilfKQpVl73jRVEbWruuAJPpMQ0NUkroa34dDoNapPCoFf7ZbBDJ8UehTnDdWybBNmUafRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyArveBCxNYS7L5NXMn2eENne3pD8r3Q+T81BM9KTTWyLSrWWbm
	F1S5sFWjQhAMH1gUAdhl9vIIwH83BDi5EdBunFRDeONxMnUwHm43dfTIFzH50Vw=
X-Gm-Gg: ASbGncuoEaqZvsYhGzcEaFNq00rBF/n8k8YgGLHjBI6itC0h3XHVFzrSxcxA5DyR7on
	JY1Yx9gOKEIlyQw9ZxMytQhOx8kdRVHIOKtCbk3ICXnlsOFRPSoIiqYo1YP/PAuy5JdAFvVtQPO
	m1pgi5ybgjfJgwI3kMoyTY3lIay3Hj8AiKUO3EYDJ2nVwNFu4t7LF2SCxIPP5skPGw9nzcl4SDw
	qXdrRdfh+UUswjAXNNlPxSHKM5e6wsia0PfMsKkWlt5MxGif2XmJt6naYQ2kHIBNOAoXT33d6fd
	/Vg8D39DBjUepvwYGFwRkohIe+D2dg3OmTWBUuiH4SbhVUyF1bBBqM70FLqCYY2qcFFkI1PzZZr
	rWfhckxeRKgkoB1ttMOfmbRdW2w==
X-Google-Smtp-Source: AGHT+IHq20LH2uxw3VbZolyrJ2NcnkJ2H6FV9IdtXZLY8mifNy7lWFQGbFrn1pfpFBMVS+O5dKaU0w==
X-Received: by 2002:a5d:64a4:0:b0:391:a74:d7dc with SMTP id ffacd0b85a97d-39132db7543mr13516692f8f.50.1741695746463;
        Tue, 11 Mar 2025 05:22:26 -0700 (PDT)
Received: from ?IPV6:2a0a:ef40:1d11:ab01:f578:9a7d:3957:bef9? ([2a0a:ef40:1d11:ab01:f578:9a7d:3957:bef9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c0e308dsm18364281f8f.67.2025.03.11.05.22.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 05:22:25 -0700 (PDT)
Message-ID: <58cd8f7b-e824-4518-8bc1-c004c8a605f2@linaro.org>
Date: Tue, 11 Mar 2025 12:22:24 +0000
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] Input: synaptics-rmi4 - handle duplicate/unknown
 PDT entries
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, david@ixit.cz
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Vincent Huang <vincent.huang@tw.synaptics.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 methanal <baclofen@tuta.io>
References: <20250308-synaptics-rmi4-v3-0-215d3e7289a2@ixit.cz>
 <20250308-synaptics-rmi4-v3-2-215d3e7289a2@ixit.cz>
 <Z885Jw0K6d2h_2pl@google.com>
Content-Language: en-US
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <Z885Jw0K6d2h_2pl@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dmitry,

On 3/10/25 19:10, Dmitry Torokhov wrote:
> Hi David,
> 
> On Sat, Mar 08, 2025 at 03:08:38PM +0100, David Heidelberg via B4 Relay wrote:
>> From: Caleb Connolly <caleb.connolly@linaro.org>
>>
>> Some third party rmi4-compatible ICs don't expose their PDT entries
>> very well. Add a few checks to skip duplicate entries as well as entries
>> for unsupported functions.
>>
>> This is required to support some phones with third party displays.
>>
>> Validated on a stock OnePlus 6T (original parts):
>> manufacturer: Synaptics, product: S3706B, fw id: 2852315
>>
>> Co-developed-by: methanal <baclofen@tuta.io>
>> Signed-off-by: methanal <baclofen@tuta.io>
>> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
>> Signed-off-by: David Heidelberg <david@ixit.cz>
>> ---
>>   drivers/input/rmi4/rmi_driver.c | 47 +++++++++++++++++++++++++++++++++++------
>>   drivers/input/rmi4/rmi_driver.h |  6 ++++++
>>   2 files changed, 47 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/input/rmi4/rmi_driver.c b/drivers/input/rmi4/rmi_driver.c
>> index 2168b6cd7167334d44553c9c566f870a4e034179..51c23a407b2731d5b6eaefe9cae6288f97316e34 100644
>> --- a/drivers/input/rmi4/rmi_driver.c
>> +++ b/drivers/input/rmi4/rmi_driver.c
>> @@ -493,12 +493,44 @@ static void rmi_driver_copy_pdt_to_fd(const struct pdt_entry *pdt,
>>   	fd->function_version = pdt->function_version;
>>   }
>>   
>> +static bool rmi_pdt_entry_is_valid(struct rmi_device *rmi_dev,
>> +				   struct pdt_scan_state *state, u8 fn)
>> +{
>> +	unsigned int i;
>> +
>> +	switch (fn) {
>> +	case 0x01:
>> +	case 0x03:
>> +	case 0x11:
>> +	case 0x12:
>> +	case 0x30:
>> +	case 0x34:
>> +	case 0x3a:
>> +	case 0x54:
>> +	case 0x55:
> 
> This mean that we need to update this code any time there is new
> function introduced. I'd rather we did not do that. The driver should be
> able to handle unknown functions.

Synaptics don't produce new RMI4 based tech anymore afaik, they have 
moved on. So I don't think there will be new functions being added here.

Unfortunately in my experience the fake touch ICs report completely 
random values here, so there really isn't a good way to handle this 
otherwise.

What if this list rather than being hardcoded here was just using the 
fn_handlers[] array from rmi_bus.c?

Kind regards,
> 
>> +		break;
>> +
>> +	default:
>> +		rmi_dbg(RMI_DEBUG_CORE, &rmi_dev->dev,
>> +			"PDT has unknown function number %#02x\n", fn);
>> +		return false;
>> +	}
>> +
>> +	for (i = 0; i < state->pdt_count; i++) {
>> +		if (state->pdts[i] == fn)
>> +			return false;
>> +	}
>> +
>> +	state->pdts[state->pdt_count++] = fn;
> 
> Duplicate detection could be handled thorough a bitmap.
> 
> Thanks.
> 

-- 
Caleb (they/them)


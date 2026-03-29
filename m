Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B1130C372
	for <phone-devel@vger.kernel.org>; Sun, 29 Mar 2026 11:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774783295; cv=none; b=A24ogmv7QcEJ/QJ+7jga0DISR5LG3xc1cpBRj5l2R9tgS0D0kQi5f02ibAHiFDHrylNEcIr1Tantvbj1kGYR8v82ChxiI4CGc49rpyHkdQ5oZLG+XUDOL98I2xzfjOeA8MyDdALzAFmjoFQM/7eaBXtv/LZcVvBwDyNV/VPfgvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774783295; c=relaxed/simple;
	bh=0wR+MgHijwGTIMJCNQj0goJOmIz68prqo+nba/9TQrc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=lEzQyJKU57s2U5C/auQwjdgOeOTAe/yJeBkv9Ey7uyecPxqTvPtDTdt/BzmgZhrG3qNk5WCPnjZPpJVHv/ExFNut1/qZ/JnsomqFSvceX7lKabMasIiDtrX+Uslx9HjNsXcNDjRQI1Vs9JfqeEDvsoVbiZbgUqVzgfX4MlCjrgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PRk0z8yR; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PRk0z8yR"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48540d21f7dso41496705e9.0
        for <phone-devel@vger.kernel.org>; Sun, 29 Mar 2026 04:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774783293; x=1775388093; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :reply-to:cc:to:from:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TwR3yI+NB25G7HZGBpVG+F40teFK60brAC7VV58HZik=;
        b=PRk0z8yRSIwFZ6p9ut7PnccqOAOZxtNAGJE5fOb6BoheoJ/ssv7jhrgQ7Xks+IVkLo
         WX76YAmAFEqHtUgQQ1LPOWJkyp8C6JefHDjZdwTkdVclx0UKT1gAFbdIEicyut3aBx0s
         4HLE8OE7cpFTX5edbZ+95n2cM0g72s9EQla8hfEUuWr8d7mAACk+hPnmadKjsOcwJihX
         zQbt2Kl2BHywtjjDlXN/8TT1iZisQMpClIhuGZjcpc+4StgY9MMHPNPY5EqPixUXeP2K
         tvN6Wir0npo1fYgz0CQ17pNsKMqKRehjxw9TsjwX7eMI2YFrN6QwC21gGhQlvsbRE2gK
         di0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774783293; x=1775388093;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :reply-to:cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TwR3yI+NB25G7HZGBpVG+F40teFK60brAC7VV58HZik=;
        b=Pq+8CrqLf5Qpg6EdviwOLyhz1pYPwlmu085KTDR1iCW3USmtwHcmWwCkAPNDvVzRK2
         hjYDSk6+4gBJxdpp4ZdMNzfPhTor8hbjfLV8JlxdQ6v85dzL/P0VpwNcStNsIrJLlT6f
         7Bx22Ntosa2z8trmNMZF9sw+plT3Htvc1ngkiPQP8ea7DZWfRjaxJAEPQd5rGZKW1ho/
         oY56MM3W8JwteYj98extsw2kwFF2I7mSWncXgCbgTLDr6nSmrxm707rc+87nhy420rh9
         CmX8JPOWVmifxdAudu3ceuIGJrBoPTDzLxwkAulv1ry2dXzMyVHwIPlZM2MYekVDe4eX
         cmFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsfGJiH8NWv8PNQrCljJZV5FPGboKEFjh8v6keFDg5DH4CPwlerM/CXAZwTKT3/hZ86SBP6eO3HwC+3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt11rUd51fEjTBUvDqtOjVgIVwyhN7a5WYdI17DfNPoAqHDjiE
	OzOKPVq+pquCsrpJ1i3uxdI0alvOUEl6pgMzm6fKV5z0X9hvdx4/Iaj0/zSQpDkhs5M=
X-Gm-Gg: ATEYQzyIgbPEnK0ek6BYb0ZVYpT8r4dOD0gLIAbwBaDlLkuvtUdm2xvCbnqeJ7UWjCI
	QArJ+RAb9KjZiFBTZTHrI4V34E5no0GoBzi8Bu6cTOF7zpVf3ufZJXkBMNBipEmrqd8EKIRIzB0
	/8MzH6/yecBRv9yFkRn/YG3AhtDoKq6Q+HKaXsmxo3K/GsyrTmoOKMCKYIjqiiQDCcGldH5rstg
	J3wzj1rjG4XXUhlWz20mXF4+SPkaCQfyNU/kJmLFFoxYwvaroVYpMSEnslB4Lp9P1qjyhrSo7X3
	edGTLR7pPXFYGlAjzJYEI5DF+Dev6s+4SyoOXcwXy2NlpCKtn64vqbYzxgx5Bg3NQJYWnwMo/TY
	2lmpJxzQu6WPCpkACgSQW/AhJD5AjHcYgNaAd/wfb/GoXf+QmlHDuSfSYAdXbS86WEDtWUUE0b2
	fdmaXh1HSHi+d/Jyx/Zzu5ITwzRr4no34=
X-Received: by 2002:a05:600c:1d15:b0:47e:e48b:506d with SMTP id 5b1f17b1804b1-48727ee9a7amr146841945e9.16.1774783292450;
        Sun, 29 Mar 2026 04:21:32 -0700 (PDT)
Received: from [192.168.0.35] ([64.43.41.12])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48725d9403esm84895655e9.1.2026.03.29.04.21.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 04:21:31 -0700 (PDT)
Message-ID: <7b580a09-672d-4e9a-b2df-0b931d00a5f2@linaro.org>
Date: Sun, 29 Mar 2026 12:21:34 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v4 8/9] media: qcom: camss: csiphy-3ph: C-PHY needs
 own lane configuration
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Joel Selvaraj <foss@joelselvaraj.com>, Kieran Bingham <kbingham@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
Reply-To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260301-qcom-cphy-v4-0-e53316d2cc65@ixit.cz>
 <20260301-qcom-cphy-v4-8-e53316d2cc65@ixit.cz>
 <nfc2CPXnL7HNGmguQY70WydVsokdSQ261I11ZurTTGfMaLnHc0UrZH-QO3J-pAeA2hV_ioU_mcW4w7DF5iQKYw==@protonmail.internalid>
 <10c3e5f1-b078-4b48-bfc6-32199270b86b@linaro.org>
Content-Language: en-US
In-Reply-To: <10c3e5f1-b078-4b48-bfc6-32199270b86b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/03/2026 09:59, Bryan O'Donoghue wrote:
> On 01/03/2026 00:51, David Heidelberg via B4 Relay wrote:
>> @bod
>> Proliferating special cases in switch statements on a per-SoC basis is
>> verboten.
> 
> Hmm, your ideas are intriguing to me, and I wish to subscribe to your
> newsletter.
> 
> ---
> bod
> 

@David.

I'm realising my Simpson's reference probably isn't actionable 
development feedback ;)

How about embeddding a pointer to either a DPHY or CPHY init sequence 
somewhere and checking that pointer ?

If it the CPHY init sequence/table in this case, is NULL return 
-EOPTNOTSUPP.

That way instead of constantly extending a switch for each new SoC we 
enumerate a pointer and check that pointer's validity.

Then we have nice clean code which just checks the value of a pointer, 
instead of an ever-growing list of SoCs in a switch.

---
bod

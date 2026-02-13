Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1643F261393
	for <phone-devel@vger.kernel.org>; Fri, 13 Feb 2026 06:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770964196; cv=none; b=A1Zt2uuS9z9V38tHJf4frbyMn1Rtx8xZw7SskPOmEJbqFZu5cve1RXyx8Qc+eo921vs37H5HFq3tQVmEiWmXZARaS8YdUp6nDe3fv31PdWy2TlTxJZ7/HInsqCEiFqS6dpD3ex206DXS4za1ZFC5wxQZ4JGRPMPv3zsAAuw85es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770964196; c=relaxed/simple;
	bh=kCswgtylYBaH+vm/oPXmR7sifyk95YR7in+IPuGhek8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YTSeEkqDZC4zj7g3vncZS9s1ffC0DIQtJS1BnKVA4AI7s0HJXHRepr5PZDev13sFUn0wPMMs9ZMgc21ZwdIo/0+KnSSnVPTHtRpahQQ/wMF6Hc3g1fQMHY3Zr66zTth0CgzG3hb0WbRa0JgiwTfLJTJahsO6W6rPL6qxzyHIiAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TvV3d3Va; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TvV3d3Va"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3870acaf897so692161fa.0
        for <phone-devel@vger.kernel.org>; Thu, 12 Feb 2026 22:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770964193; x=1771568993; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OUbCeLqkSBbz9Qag85Qyx4nbeZ0oQ9o4jeNsX3hpN7E=;
        b=TvV3d3Va8K1iBsadKDQqIW603oHKx8o3Xuto8XmG4SPghONKlNfmUGxssGv15pFmlh
         f0Um43LcP8I2FfsUTbgckiZx9nyDPOWbG7jS3qUisOTpOL1Y+sIxPouZ7+xzF2YeeckY
         nycxvmGg8UNHNVMTMjZQpIETgFT0uZ+O4N8Jlf6j5uHeg4Vxl3hxhiYlq+DsbcXoVDad
         tOnWCFbYNs7IkbS1tWzHUWDaFsIcnedDoJdbesHm5tb5iAdvT/48kRyQJskIMD2oIveg
         GXSRJCyFbfaxt8r+k0912VwGZJ+CcFwnFkWFxtBNhG3MhdjKyZLll0CTgp7N+uo8gVqP
         lOIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770964193; x=1771568993;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OUbCeLqkSBbz9Qag85Qyx4nbeZ0oQ9o4jeNsX3hpN7E=;
        b=bQwpBEDknQnJYFKnadIFojO7KJj+IVl8woE7KGCYYxHwzVeIAehjcR4m+5hp/RD4W2
         P01PuaLwBX90m/c13zgEKGNHpFlplIZ4pckQwh1QGlwvcZQO2IxiL4+FJU5YaaXhCKQl
         ln7K7NiNdcavN6TiT2atPoqKWLr+Y6du+1BCuJZWSMTSo3t6BkFupm5hSYVQ6lVasAhw
         X4ispwNAaV1o4cd2oYmxhh8lrnquBaC73jAsYplmyAlbVi9ywkRarkMAYe/cdrj8Sk9m
         zMrVEUN5RJkhPPWnmxtjTLJrsjFf4O9JWQomDupqDMTAE3Xa5XaUreQPpNUf7DMxgUaH
         aaBA==
X-Forwarded-Encrypted: i=1; AJvYcCU3hA0VA/tq2E2pwIKEMt0H5Cx9FcWqYU6BHjvrI/thCB6fg6VdsFmKB4w5v8hk2/8N9Ckmgot4asIkCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyueVKsjBNXR0QEyxbhl7RPhXvS+mG93CMgFh0w74lZi2TPBWu
	3XSO5iFyZlfdarrckKoo5AMgPzg2axXOIB/v/XW0VYFOYzAygFFXTGfYzG8uTu9Ge/I=
X-Gm-Gg: AZuq6aLELCoMioG6zyZAfejt59tTpmdRHhfBKqEy3ToblgyM59hQB2iLN9LzyoRJtDE
	yaL3s1w05Y4y/Jx9fyH/Twrm7CXgj32g8jHx/LMnYNspH3NGG3B2ewCOO6NWULMUfbY3UcEM3J8
	NHB0vUkY5YUwS8dTMWGHqd3lfd2cgtyDfthNQ+brrStBTQIhXisFoYgzfFhcN7w76txxE0liY8M
	U2CgK/S8UCXKoNcPG87Ex4h7qV3XQynmi//fUvGjxGgmZSUg7DIg5+uyZN+rLAvO8GQOVSV0fIJ
	avA3/EaiJpFWEAwOc36fZZWQBoWHgQWGMMJ1IrmZsItHmjRD2q5tBAm4XCEma+sITCe0i7muHAd
	7IqLsS7K4BLr4MOuLY/OiKxef+iu9tlQy50uQG/VdIxO/p898F1IIiYPvRAfmOSvCyZKhodZhP6
	H1SolrJkpfd88M8VLVW/nnmiY7hyozPDiWl1MtfOgrmhFeMNX2dDo0XKjsfbPRDQoAhKVUTtN8b
	1avwA==
X-Received: by 2002:a2e:be2b:0:b0:387:170:73ff with SMTP id 38308e7fff4ca-387ed8ce87emr2166921fa.4.1770964193194;
        Thu, 12 Feb 2026 22:29:53 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-387068925a8sm11374891fa.8.2026.02.12.22.29.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 22:29:51 -0800 (PST)
Message-ID: <e63b5a65-3c59-433f-a8cf-93bac14aead0@linaro.org>
Date: Fri, 13 Feb 2026 08:29:42 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/7] media: i2c: IMX355 for the Pixel 3a
To: Richard Acayan <mailingradian@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Tianshu Qiu
 <tian.shu.qiu@intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
 David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org
References: <20260210020207.10246-1-mailingradian@gmail.com>
 <aYvLppaYsNDDD4DX@rdacayan>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <aYvLppaYsNDDD4DX@rdacayan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/11/26 02:21, Richard Acayan wrote:
> On Mon, Feb 09, 2026 at 09:01:59PM -0500, Richard Acayan wrote:
>> This adds support for the IMX355 in devicetree and adds support for the
>> Pixel 3a front camera.
>>
>> Changes since v7 (https://lore.kernel.org/r/20260117040657.27043-1-mailingradian@gmail.com):
>> - restrict data-lanes to 4 (4/7)
> 
> Apparently the 4th patch has been blocked by Gmail.

To complete the series you can send it by

   git send-email --in-reply-to="<20260210020207.10246-1-mailingradian@gmail.com>" <snip> v8-0004-*

-- 
Best wishes,
Vladimir

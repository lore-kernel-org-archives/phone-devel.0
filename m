Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56993812E1
	for <phone-devel@vger.kernel.org>; Sun, 30 Aug 2026 07:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788075437; cv=none; b=Tg7s0vx0oj6vLmwNCVkBb0IuaWHVkj6oUYnLkOTRzNbnB/ghaY0A/wrIOTaIC6Op6+lSvK86l+jBI2dntrWnl2reaujBClD4Oue69wUJjteoBtEZOSRbNK56ZPH3VN7qv8WFuZ1QtT59CFBXO74tMU0O2L0HDs26CfR6MU320GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788075437; c=relaxed/simple;
	bh=ASrGp8zTgurRcysp4W2GZweU1AMnNyJvAleGf5hP4hA=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=AZH/Cb58IYmLWCKX18hJXGAL8GD8J0tfHzaUG2kMhkfnx4xs3stDP9Ea+quwl8Bs/eC8zeVU4kR/OR89lh7qwYV/d9/0ks3HP2l9kItgC8yA6kWS8ukcbxtrbkw9P93YCgWvi9L3e7VkD9N0Q7GbOmAJ1P6XEgILpzEwVlLhrXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rkwh9Goa; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rkwh9Goa"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d7195706f1so23878105ad.0
        for <phone-devel@vger.kernel.org>; Sun, 30 Aug 2026 00:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788075435; x=1788680235; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ASrGp8zTgurRcysp4W2GZweU1AMnNyJvAleGf5hP4hA=;
        b=Rkwh9GoaBrwMxLrMfUsl7S+1x6p2Bwz1AeKPE/4rr29GaMBwPpV51logrpAE6tHP5S
         Oi7bGjH3qMdEuyjed6hvp4Ge7KsLQePC1MuZ6W5ac5ZZ1acqmxfgTqXG2U2pt2p2vaH5
         +wDhwCSqzEsQxYLwtZ7NubB0srAFh15SCG+UkqN3+UINEWYAB4OUe1mH8TFapv/KlJC/
         A6XTlwUAymM7gLQDtTKjZgZV7wxBTsg6UekgBLg7mkrMV39G0nd486M0d+1LD9FaYt2K
         c+RViA3V1aeENSnqqNW7zguXV02dMmnLY81b5/DY/4l/DjMGNoxtLID8U9WGaQIwyKwk
         XoQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788075435; x=1788680235;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ASrGp8zTgurRcysp4W2GZweU1AMnNyJvAleGf5hP4hA=;
        b=Rxfpv0ZutpAAEkyS/CiekATOGV4r3eDOWV7//QtB/8eni7DjFnuEIC9W03wDVaYgjm
         POfUcttZeW+5u/+TdkvU2F9dHjd7PMlQmD8dQF0BEFND+JnHQxxdYwitJHhZNbXghcSf
         b2X4aH29OMUi9ZFdG4gwr4WoPw5jAPlWYt9t1hxN1iGJ97qGEkV7GJ4Bnei22gHtFXvo
         ipKkH1+qS6ddhVPxRmqJm+AJA61x0YbZjXSbZDVkoK8vQjnTmOyPN/0coquUVdxriaQU
         6jjOmV8UalEwYw+LhLHKQHZ+vRINyMbHz510xuVDjkfKPWPtGUUTrMDDm9Uy+1l+o+JT
         9gCw==
X-Forwarded-Encrypted: i=1; AHgh+RqooPS1uVcXKRLLafDURIv9qNLuvTt3ikDc7swOQ+TAxbRHuww9hnF/xySFK5DIime6cebCTxiGRgaAlw==@vger.kernel.org
X-Gm-Message-State: AFuF++lvYffNZvQvGx353lCeQQn1xAwVjyYpxvqB83P+w/RFqh5Ck/4/
	IdHH6qNcmSh1MxJNrb4zVxWwSXY6q1MaKI7kBWX9phDGR20g4OILlwbV
X-Gm-Gg: AYBFou1Bnp4Yj7nCY4MSBiCCkqVb1XhQhBjov9nYWewC20v7Co0o51illQmQ6bg/bIH
	qkQRipcX3W4tUOkn5z59MsBws1bSaFxeQazyO3kx4X4pdEHFne9lksxptuEjS54hBt+muDtDAzr
	UzSJt9+RelUdCAjrnndmHgGWSV36AdCvjrxCfVCgVrAzxDpjMBGca8yls0bTofH8RUIK26RH0pQ
	jbVCFLIwuMlzVKOInoIKezBsxpWe9D7aSCxTrg4cFnME1YuHa9vaCiZZL7LwNaosFxSYUOroMV9
	BCCPbVjBCEKkdtcvBj18thaDHlGkHBTLKD5c61OH2jEPmlnBf+b3Fzr7fa/qyv3zxGPI4EfL8Lz
	VzGzKD1bOF+V32pu/QSF1D3GEFt96dTVE2ZF6jAHGTuvZ3wRm1lGozsMJeBznekICA1O4W59umt
	PD8JMdf+t3ZS9pU4tBt4x8tZpyMOLzGShbUi79/O/7c7nzJDHj7mYPKIByenimpOWLcx8SRgere
	dX3zOEYAz9bt/j7BtHV+5ZXDrtPEpchAXs0SBuFx5Q=
X-Received: by 2002:a17:903:1a2d:b0:2d8:d4cc:be64 with SMTP id d9443c01a7336-2d8d4ccc92amr160990335ad.17.1788075435070;
        Sun, 30 Aug 2026 00:37:15 -0700 (PDT)
Received: from [192.168.68.67] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9e3cf8sm22814491eec.24.2026.08.30.00.37.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2026 00:37:14 -0700 (PDT)
Message-ID: <edb89cda-3c2f-4e1f-a545-2f2fe52c8b5a@gmail.com>
Date: Sun, 30 Aug 2026 00:37:14 -0700
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: devnull+muzafferkadir.mainlining.org@kernel.org
Cc: git@luigi311.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, mchehab@kernel.org, megi@xff.cz,
 muzafferkadir@mainlining.org, pavel@ucw.cz, phone-devel@vger.kernel.org,
 sakari.ailus@linux.intel.com, tomm.merciai@gmail.com
References: <20260829-imx258-add-reset-gpio-patch-v2-2-bfd27891e225@mainlining.org>
Subject: Re: [PATCH v2 2/2] media: i2c: imx258: Add reset-gpio support
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <20260829-imx258-add-reset-gpio-patch-v2-2-bfd27891e225@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Tested-by: Rudraksha Gupta <guptarud@gmail.com>


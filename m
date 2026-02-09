Received: from mail-yx1-f65.google.com (mail-yx1-f65.google.com [74.125.224.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6615A37BE69
	for <phone-devel@vger.kernel.org>; Mon,  9 Feb 2026 15:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770649374; cv=none; b=kclnmgu2NjBI/J31ukK6WuarAyCZMpja0Hyj/iLSuuQOHvwZHUk0AgA3+bdU4rCJb7epUH7hXKmo1ZOkLbnL1YLfVQCm8i0uKYXZqSAP7ehuv2pD9qwqnH68vDWHqnJTU0OsB0zxh7grdc2Aa8JxvHo3YaD86Hx9IBO7pBGeFQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770649374; c=relaxed/simple;
	bh=pvzEly1h6RX+5nVyvYuepMJ628AC7g5OzHsBQ/W1VAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o7ODx2rvCg2peY0gHoA1opcdZjd3L6g/x99YTOk2C3Jsd7KmtT9pK1R4YuX2K3jgGOJw+ruAw3lj9W1XwCVUEJ4tmetp8xtL683myHfWTnMvzn7NrTZAe+kDrWNR92dIHy0EoxaYX6euk7sLqOi2NKMMvvLrsWXeXP72m55nV2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PAnSSzJP; arc=none smtp.client-ip=74.125.224.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PAnSSzJP"
Received: by mail-yx1-f65.google.com with SMTP id 956f58d0204a3-64ad019bbd4so2560393d50.0
        for <phone-devel@vger.kernel.org>; Mon, 09 Feb 2026 07:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770649373; x=1771254173; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JnnQJD+R93yDtjYhHjFYKLpvoPEvYMiSVqgAW4EPMRI=;
        b=PAnSSzJP8ujJVxqTMnZRfCrGq9BowYuIdYfD97HBGs8nuwlaaNTUGdkxL9ZSgiGN/H
         4Kww/lnhaehBHxy6C6dsSmFMPXdjOp9c8oguptPCIZi3ChArLGH0LI73rqWuAPYQBtpV
         apHg7Fq86zIfEWeJuMIRuR1u6zgJvJ2aztjJJy+v9Cw0qyFkk+sjGgFuIURJl+VxtLjB
         XqG5YRMdSlf3F/4bpkvPWSLCr6KFYRWHWUUbKoUYiARgp1FZlZkPCXOLOCHK0WQN5Jb0
         KG4/oheYSQOOzAm1NUo7Bfz0DUhCXW26W/qaxSuHK3AjBLvEL1wWAK+uHHN4am5nwf/d
         LB+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770649373; x=1771254173;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JnnQJD+R93yDtjYhHjFYKLpvoPEvYMiSVqgAW4EPMRI=;
        b=MhDSebS1dETzMCZfgIu+iEgG91YQezP9GPpnGPHI1e2O6HFF+bghPUbsdFQKAcGidF
         cGpZtI8o11ad3/cirOLIs7w4Om9hqUV7xAK7nv4fG4knhFac8s8ybTrtpGfguqI4xB0X
         ewiFH++OGQSfQnzsDC9gyUW0GK4lRqtEcBRRxsIDzvlcJpQCsQTEDnr8635ykvWpGnKB
         uWMGzOniEd4GSfA6LYCQXjX6IC6Z5LFnai6I58QbJrxTcM8d2wPXiFPLyfb0QlZQQ+tZ
         ySIT7j53cdkxVDsloGkpydnDK6KDZr6Rc1Qe7uiJx4tgVITYnpwrsGzljVOx02/Ztaax
         Y7FQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCnwqDFg38RS7GgStMaC5N9NWprNNcwuIkiOCgJfEYXGmy0ofN8UJUjHapyBqfor/cdbZAxfWwJ6SfdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfSHyNUKyrbHlCwbZsCbc5l+O/ItE16+vVrJfVNx9w2PuHUjEx
	ueFnGlFfcJeMgHMqvPPy2OS7BbH2O9FKxM6yx9oNO/6CcvJNLoY0nhR1
X-Gm-Gg: AZuq6aKGPcnUzA/vgCTl/SZeGzQf1TURW+2SU1bQByehA5iuTkFi4kM0LQJHAWmb117
	6ZPs6U6ybo1sVef3VJZt1kmzdT4pf2r3VKmN1b0a5L4KscFwuGndnkSHGZrxnBaBlwVX68xBLO7
	bn/3hZZwHdJedm1bjjLToej88OYAPhh+6qvi+0cIT41V0eMkmXHw2tB/U/XFjH2L+m9UpEra1vO
	S+t7HFOOQ4Xt72pYaRb3Lxew9Ow8HNiSaYLqBvGZ2NWNgcVYgcFMUcGmqrRdOBz5ec0Le8AoPgD
	UskZIa35LmSCETlMLL+22CbMaW++MQ+4vYWIb0l6EcEeJ/iqsIA96YsiZwQg7f7uYn6Z8IMUuyA
	1JlPzFHeRh+Jj+C8sJCFLhazJS7Uv1DJgiwwfr2ivDNJOy72/tN63E68p6NkMRXSHDUbj/WE6tl
	DxsLPaHBa4aVbCvg==
X-Received: by 2002:a05:690e:13c6:b0:64a:e3a6:c393 with SMTP id 956f58d0204a3-64ae3a6c5bdmr2693312d50.77.1770649372033;
        Mon, 09 Feb 2026 07:02:52 -0800 (PST)
Received: from [192.168.0.40] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-649f248c511sm10301423d50.8.2026.02.09.07.02.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 07:02:51 -0800 (PST)
Message-ID: <dcff3895-53c6-496c-8574-96943d1eddc5@gmail.com>
Date: Mon, 9 Feb 2026 17:02:46 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: Add binding document for cm36686
To: Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Cameron
 <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Tsai <ktsai@capellamicro.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
References: <20260209-cm36686-v2-0-a48126d2b124@gmail.com>
 <20260209-cm36686-v2-1-a48126d2b124@gmail.com>
 <5614db64-3ee4-4a41-bd8b-5b89cc3264aa@kernel.org>
From: Erikas Bitovtas <xerikasxx@gmail.com>
Content-Language: en-US
In-Reply-To: <5614db64-3ee4-4a41-bd8b-5b89cc3264aa@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

> Compatible says cm36672p... Confusing. 
> Why higher number is the fallback? Explain this in the commit msg.

This driver was initially written for cm36686, which is an ambient light and
proximity sensor. But cm36672p shares the same register and regfield layout, it
is just missing an ambient light channel, because it is a proximity-only sensor
and has no ambient light registers.
In v1 the compatible looked like this:
  compatible:
    enum:
      - capella,cm36686
      - capella,cm36672p


Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA383101DC
	for <phone-devel@vger.kernel.org>; Wed, 11 Mar 2026 12:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773232806; cv=none; b=KHt0PIQ8CGQg/l3Uf/kd2+Yr1JUk0RvpMwh9S0tTo3UgQg94SSxTHlDTFrA0RhjZt8e3ahRvJ70tFWzgc/GQC1o4oTFRKRfhl8ye4tXcyA81owFnyVfYxrem1GyXjtHnhIReaBWfYUrEbBTakMOu3+MV8+AMfxVLfLiS44iiwgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773232806; c=relaxed/simple;
	bh=ypkgbZBJnCuKYz1Q4k4xX9VYLpvEeclpOgAoB/0XkJM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y6os3Ls0R9yX5/OjhNS82GLn+NCuuttsBJdwNBZo4/HPhMK80Q4kpiyEXRtZxSbdtRYJ2rp0Gjus19JmyOTDfNeply7PJpe0OKrdC/6+CJJZG0YHsXibJjnkd4/Jde4M4zGP/EuJUOcwJadJn2haLUlgNVQxBSbxX+kFrIadJTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ks3HfIZH; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ks3HfIZH"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439b9b1900bso7620662f8f.1
        for <phone-devel@vger.kernel.org>; Wed, 11 Mar 2026 05:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773232803; x=1773837603; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7bkd7t4OM6NrSXY3/5JBnKwSTKqs/TjWcikuqUhFmKk=;
        b=ks3HfIZHFPQ17cYq+md0FuV9Xlp4eBom2GooUYxQ5wIyfSn+i1EPXp9l5WXZVhBcan
         VNfc1UOyqa8+CNp9pm2wcR/7bgDE9Xd/dEQ+9u5e5XorRlrGsISA18PNgAONxDMa18t9
         tbUhzrTijFI5H2o0NBIv/6hn/LAUerf9lZF8XF5raDxuTdCfY/Z0bcttXbMCgXzsAYDD
         0tls6l/4fpSxpcy1suXHHqH5u9IUBLNGn4Dlj8vndULlr16J8sP7TP9/sPHXyj7feM2d
         mSsJT/yvVNfWO9n+SzO8hgjT1M/79SL0outxxZcWx1I9c6+HcO29x+d178Jy7+fWDNww
         9Frg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773232803; x=1773837603;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7bkd7t4OM6NrSXY3/5JBnKwSTKqs/TjWcikuqUhFmKk=;
        b=Cd8UfW+8nl+NNhqceeha2xWpzjivQkWU1/h2Ywk90CZxETffw0Xs3VRdo11T3q+BFz
         ZHiZjs3ona6N2sp2DZN5acTaDE1psYaGSbmKinwynHSZrYbuVI+u6do/9hXNj2z2AS7F
         +8OVNmp2NZKt78mEtnodu9utA6eXANJFJcUG2Kevw0BwdT32/2Iw/MCk0QG39LrGHTAU
         BOK9zdn1JXR7YQ5EKK4NphDCzoCnuiTtuSX0XWRNArzebOtcLXqrb/1YzBh02amXw4PW
         n5w9Vzszl5oAJMbBgFefz9FkhgdobMU36nfjvS5RWLrMK9vKVzkXaYr114iGTtFPIRCB
         RrEg==
X-Forwarded-Encrypted: i=1; AJvYcCWfdcX5eZC7+zBB38PAxZY1BlOrrtFIu1n07iRuzPj7L+BTHt/YXUYPa3E2zRnD+R2OU6q2kLgQ45rMnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsllkFABxPQWbVPKI3ZZLzRe2ExZZYstMyAj/Cm0JkFwAJwNOI
	McZvZ26QRxpamVIFUw7re+WnFsS4bnfQB5eripBtnJ19491+R1IhzS/E
X-Gm-Gg: ATEYQzxg/RghtQLmKh41lwt84KpQD2H17d5nXxWkjbp+9IQUr0CBkcuuzFUf1iWMhHF
	5BxTBn7xZj+EvctFykF7l7mXrPvvFigLOwVO9koP1ckdDZn++ttso5rU4utFQws2SgDxRAbpqiQ
	Sf8Qsknnsc36/5Tfxtc7AsTQGRsIZ6QIJ/uwC+xP5Yq2IwJRLaDXiKkXVxbT6f9rL1Rm3VBtPsZ
	x8SCgjbktSk/+Ji5lowyolm2hVhz3RPFbRpho+KrrbBPImJ1QsZK9fu7TGh9+9FocREyR0wwv4R
	LyDK82zjtabGcyAtaLSy2zmYEF9JahfUuuxdirKAXHgRQ857VnfDW9PjBv154bp5qeJK0tN96c5
	y6kGVB9KM9qZV4GY6Gmu9JwOXl78nnzpsL8TRUfWcL5Ji7fDi7IJt5T7dL22tVV4/BjhR695CFB
	e9oWzRxTC3VIh/oq3lX7v83NSSj+X0pflzRPXp
X-Received: by 2002:a05:6000:2503:b0:439:ad72:9900 with SMTP id ffacd0b85a97d-439f821ba00mr5021469f8f.29.1773232802942;
        Wed, 11 Mar 2026 05:40:02 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f81aca65sm7461346f8f.17.2026.03.11.05.40.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 05:40:02 -0700 (PDT)
Message-ID: <9e5babd2-3e11-4c79-9192-379b11392a58@gmail.com>
Date: Wed, 11 Mar 2026 14:40:00 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] iio: light: vcnl4000: add regulator support
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Meerwald <pmeerw@pmeerw.net>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Raymond Hackley <raymondhackley@protonmail.com>
References: <20260311-vcnl4000-regulators-v1-0-66b6038ce563@gmail.com>
 <20260311-vcnl4000-regulators-v1-2-66b6038ce563@gmail.com>
 <abFejMb3uLbg4fiu@ashevche-desk.local>
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <abFejMb3uLbg4fiu@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/11/26 2:22 PM, Andy Shevchenko wrote:
> On Wed, Mar 11, 2026 at 01:38:03PM +0200, Erikas Bitovtas wrote:
>> Add supply, I2C and cathode voltage regulators to the sensor and enable
>> them. This keeps the sensor powered on even after its only supply shared
>> by another device shuts down.
> 
>> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
>> Reported-by: Raymond Hackley <raymondhackley@protonmail.com>
> 
> Where was it reported? Do you need Closes tag?
> 
> ...
The report was done outside of LKML, in a Matrix channel.

Respectfully,
Erikas Bitovtas

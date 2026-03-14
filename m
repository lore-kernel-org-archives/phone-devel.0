Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A77F37F75F
	for <phone-devel@vger.kernel.org>; Sat, 14 Mar 2026 19:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773518034; cv=none; b=dvU9hjXjtgsqcNO0fslBvWbIXyjSTucF5UemwiJZUqcfVnkGZnUUsadQE7x+MvA+nqbeexv8uso0jc8RI1ykImAElN7bxVuoaA3kAN4ZTjg+njy/V3mvmL4IEBOV5WR/l70bmPGOmYYdrNea3Y/W14wUUlTFtZGrw/GbldEFyJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773518034; c=relaxed/simple;
	bh=WoYBcfnqdXjGLK8p2ATCDv5Clwk3rCl9OK1fQPfrqbk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Navqyz7ukHghw/61l7pr7kOB1T6u/qBsVevMIguUvwYstbfG2jdRqpc7Bohu3SKGINyCRj9JOmqDidP5fmXSYeFrdsIeF6FnqZJz8Sx2wks3X4zOX3dUsz9egcsWxmNg1arMWHx9u+Lnv7EMw48E+PH15eu50n009ImPm/M8Dx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=phCg3G4U; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="phCg3G4U"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-415e568a7ecso1191126fac.0
        for <phone-devel@vger.kernel.org>; Sat, 14 Mar 2026 12:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773518031; x=1774122831; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jAUWUxgIJbO5o3ZCocsIhLG9qA3mcb6cANaDC/wIQ9Q=;
        b=phCg3G4UpLjTDCiRn9Kfgzoxih14sZ5+A46wkuduGbAUTVGGLJioPsmvFndMoCGiMC
         5F72fHgNzPfMvaOYwbWPQF8Cb1hItKBp8s5bRB9tc4xzsRHP71pt1kUW7QxtT22UwJZL
         KzpaqbLAuNPt9lsQ9JjpzsabOqz3Tf7ZHF10Bvx6ayJdVxSCCiLwMGu6pCpLgQP8fdGR
         cQOkocPaO5DOzZ5eDlzz/jPXcKPFU8wL8fT4uVNcazviiCTFF0wMK0NwIacOHa+W1W4m
         w1KjV0cWB59E2z6g6Cy17EOGkCEVcp94RRmC0IfU2i+Hx+NOYu9fIv2tVe+RTNtekcd1
         r04Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773518031; x=1774122831;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jAUWUxgIJbO5o3ZCocsIhLG9qA3mcb6cANaDC/wIQ9Q=;
        b=a2JWrCnzNxlMD32MVMJ9KYPjATjBhjBlHrAXp8rZeKBF9HEcTDuERTznEOWHk3htmk
         2LO1NuUoqjhrVbnXQ9uaqpFxhZMo07Ce2WXDVtX0lakEC0vV5GgrMRGzOpyDOwfV7Xtd
         gvIUnXOEl+aEcA0Z5kGnRITbmaA/DWk2mVIlGVHviK8p3Ryz1kVsF9w1soD2MOzfHZpA
         WooDMD1t5Q3s/VSFw6QleFSapFTogXL7gb8wq9vL+k0eVo/zj9RmaUFpJ7uyvNKpWRpf
         lMHp5/21NgCVQCGZqP4htsXPPoS5VrKWT/LghCwLeFFKJ/8WeU1lKoELYqEHJqGf0B8Z
         LFkw==
X-Forwarded-Encrypted: i=1; AJvYcCXu7R+gGPTfflrCFH6mtMjCZTWV0awxYauVqnH+oanTh3pfNSdzkF4t7SSwwMY/x56MYfxt8sUVg+ZEiw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDApJdFJCQPwfAq7+aCAlA4gA0/JRuyHh8vCGgql4KC5sKPcZP
	FVgKbw/YYPirui/sd4v/RAhr4tfd9SXUpgltCTs7DNmOJsEak5ITbQbFmQ+pw9QXhxg=
X-Gm-Gg: ATEYQzxgk0cVi2oT2GOsHbGaQDibLbFtOoQqHMV5GKVtooKPax+JPai/HbPfG7yj0In
	NxfLNqIYW7bi6VyHgSQH6PPqV4asaQEdR3eJkLFcc+H/O7JTdpfxGwFQ5ziWH+YxaGjH4sLAiXD
	rqme9MabNaCqd5hKAXYTLVcMgnNbh5OmuLIYP/IPw85xhrqm/Mr1Q02oxxVuDOVi7Ka12lypYB7
	cnIc79cisNTG0G3TKDS5t2kmDhZi4mkLyK+NHbPfhVTQh3VwBGRwIzNS6o32FIvCAfWGOSu9Ah3
	xMIHhqONcuy7z8QusNF1QMs2skOY/I8dyCbgQ5VYSrAgp3yejyfbAeejtAYTrGb/jx7AxdwIMPS
	+kJlkeAZtboGNpNfvF6oyS0pCxZXDhNkZRnfQTrl3hgGKS6Okf3TtGZpi5SSbmUwlanlK+dhqRz
	58Y/4WTyWbAp8nySl3NPGLh7V2f2vGK2A9bDIExi367Z81WO1+2J7mIEtfUnJAuBMWi7CaHZ2st
	F75O80E6WRz
X-Received: by 2002:a05:6870:d8c:b0:404:33e1:3cc2 with SMTP id 586e51a60fabf-417b91b2c8fmr4441451fac.13.1773518030913;
        Sat, 14 Mar 2026 12:53:50 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:14a9:db6c:e65a:4287? ([2600:8803:e7e4:500:14a9:db6c:e65a:4287])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4177e64a931sm12099255fac.14.2026.03.14.12.53.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Mar 2026 12:53:49 -0700 (PDT)
Message-ID: <cb92bb47-9078-475d-b242-71e3f9181a72@baylibre.com>
Date: Sat, 14 Mar 2026 14:53:47 -0500
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] iio: light: vcnl4000: add regulator support
To: Erikas Bitovtas <xerikasxx@gmail.com>, Jonathan Cameron
 <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Meerwald <pmeerw@pmeerw.net>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Raymond Hackley <raymondhackley@protonmail.com>
References: <20260314-vcnl4000-regulators-v3-0-3c4a48d30676@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260314-vcnl4000-regulators-v3-0-3c4a48d30676@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/14/26 11:06 AM, Erikas Bitovtas wrote:
> This patch series introduces support for voltage supply, I2C and cathode
> regulators. This fixes an issue where if a regulator is shared between
> the proximity sensor and some other device, and the other device is
> powered off, the proximity sensor would be powered off as well.
> 
> One of the commits includes a Reported-by: tag without a Closes: tag -
> the report was done outside of LKML.

If it is on the public web, we can still add a link. You can just reply
to that patch with the tag (if there is one) and it will get picked up.

> 
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---

Reviewed-by: David Lechner <dlechner@baylibre.com>


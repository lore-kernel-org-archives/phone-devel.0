Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB761DF25C
	for <phone-devel@vger.kernel.org>; Wed, 29 Apr 2026 08:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777452625; cv=none; b=AQSJ24QBK74NPlqnVZsoAXbBuiAtu7yhdWOsQ/wo3vI11Jpaanl4F3Vf/zhxF5FOiH7/PPXGQCz2Lpr35u44kI3v22r7gf/t5/wLsm4YRdUsJeOPP6zpQNY6Mmn5c6xzAl62K4sOTXEkfzBe6gAvbdzxP+xSI8UNW1ibucn/mvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777452625; c=relaxed/simple;
	bh=+Hf8d50AjQEGaweMj0N4PCquHvG4DR45l3h8zBAZVbE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gkmvmiYeBjkWtt2iGKGtwZxcUJBYb/EzTRL8zXdxfIteOwMZTi4bXCtxzmpLC0ezrvSNWgAUGLxgCLEgvuzrPN3w9+6opnAss5zHSDlUacBzamqQQADDosqTjgh8CLb36zPZZi8U6n7r/p5di2IjujZ6ZMjYolQb91rkXqal0vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gR1bJcFK; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gR1bJcFK"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so105528435e9.2
        for <phone-devel@vger.kernel.org>; Wed, 29 Apr 2026 01:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777452622; x=1778057422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gXiswBwjfJN5UHPIIUzkHSv3u4FjAaBgmiudyaPDMk4=;
        b=gR1bJcFKuWt1cQ5mBSnXhdrbkbc0FfB0glj7lM9trxqX6GD+Ku21OqFNX2pu1h4c8x
         vK39Ah9GeRbCseX2Lbnv/h3R3MyPypPAZ+EYpcNh/uHM6Xp49y2a7WwvezFCpdSAyiyr
         leABaK0TlL/TwG75sW8MOomiwYS8bahO+E9tMGIuPFE1MGhQ86HyT1RNJdmN/Z75vzxf
         tN5goPuby05QQ+iUWND9p5CdC/Z4mYzZOy6p03y+3/ZmoWdlsCb5idssCgKVWaFWeK1A
         yQAlY93dlGYOUwLfbgThHdEsrg4rBNRWcP8Z9JRh85oAaaTYjy6kigEHBcDjFN42u1rt
         6eHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777452622; x=1778057422;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gXiswBwjfJN5UHPIIUzkHSv3u4FjAaBgmiudyaPDMk4=;
        b=DiiJNqbprib22AgqCAa/hUFw/T3APLwbB6QqDE14GX19rtoPkTEFuy9cLkGHW3TQPh
         SB79PgV2T/gRfhZNTkBDg7M+eC2NWnwuyxMzqiW7HIXveFZK6I/moz9ZK/8gkpWTO51e
         xN5zPV7NzKxeSJvTjKTf3ve1hWMBcbLv/0LSAc5i8qhZ6TK9+aXEj+6Q2q8iuyAfG8mW
         4XPShAsQrd9gGg/YJByrOwU0oZA1j4fWkekOcl51y9sWxgORlHauI7XGCj1hfzFWgO0U
         nWVvtYlsW3Y3VSN1eoCfRDC9UL7/jUUoM2NtCLiF/pJI5CxPdtqUVMd8zTIQUBKMQhSp
         kxBg==
X-Forwarded-Encrypted: i=1; AFNElJ9xaECqjb1OYutNQCbNwBAPxvRGpRjkcd7LLx8CytBE9SY+aDAnEgMJLq6ZBYl6ozyoZQCXPIo071klTA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/t/RrRPn7gQwcBVl6Ey+/iEDey41SndP7RAq1x+OYZElf0WAL
	BsyTCQth5TPdq6B8u1n6NCgPz94MKRqifi2vN8R/FWOMEsC5dXuBrcLWnO2j31U1UFY=
X-Gm-Gg: AeBDiev/OC/t3QkmXVwdX5/TGRrjN5uAVUHK7lSKW/p2yUhyiThvNZrs28rrK8HxtbX
	w9v+Xv7QLReCrS0Qh4vARlZUZwNhrYozy4rQ2d3tg5SWhfeAkHPrtQYNjqRo1fvioqYn6/b0Z8N
	IPFLMqazDXe8I0qOwoG71M3/B3Wh7gksvDN6TqT0FprDkgIRpPUz9ufbun4u10VTZYeMATMkcr/
	eYviDPTqfFEHe/57vEKbDVPKsKg/W1G6GnZkHyMib4xoZVmefN9lbJ494DaxbV2bQ1s389qYTel
	NUaPlDBgMVCQnf8lIt95AVDB/4FIfYslkrLPfKTfoGEZoy5SjGciYJYM/s49hq/KrvpF3ed1yvV
	+bS2ygFkubgcrlh0M16qNxyx4uS/iyqeZUpyfKLWHShSjFtwQprprwR8Ss+1qZXQVIZqhGPFmDH
	FuclJaykrymhH5PWsdbAbP5qSTBUSZtW/HqFw31FMWZl1HlF9rD4MIoehb6qfpPJ7hMFeI1TNP4
	Q9vdes=
X-Received: by 2002:a05:600c:a119:b0:488:b8bc:6a32 with SMTP id 5b1f17b1804b1-48a7b5473c7mr36832405e9.23.1777452622478;
        Wed, 29 Apr 2026 01:50:22 -0700 (PDT)
Received: from lion.localdomain (p4fc3dd86.dip0.t-ipconnect.de. [79.195.221.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c326873sm13923465e9.34.2026.04.29.01.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 01:50:21 -0700 (PDT)
From: Casey Connolly <casey.connolly@linaro.org>
To: Sumit Garg <sumit.garg@kernel.org>, u-boot-qcom@groups.io, 
 u-boot@lists.denx.de, Antony Kurniawan Soemardi <linux@smankusors.com>
Cc: Tom Rini <trini@konsulko.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Day <me@samcday.com>, 
 Sughosh Ganu <sughosh.ganu@arm.com>, George Chan <gchan9527@gmail.com>, 
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, phone-devel@vger.kernel.org
In-Reply-To: <20260217-qcom-fdt-overlay-v1-1-d0fa0e70d738@smankusors.com>
References: <20260217-qcom-fdt-overlay-v1-1-d0fa0e70d738@smankusors.com>
Subject: Re: [PATCH] mach-snapdragon: allocate memory for DT overlays
Message-Id: <177745261543.126665.11547624657879722362.b4-ty@b4>
Date: Wed, 29 Apr 2026 10:50:15 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=554;
 i=casey.connolly@linaro.org; h=from:subject:message-id;
 bh=V5gwdc39n8AjwUInVNfi/JKLV76E69c7Ygir2k1Dvaw=;
 b=kA0DAAgReTBFn7kwMhcByyZiAGnxxk2gNp7r1VLDXNSk/oPihjpKOvbcmwNOhFb9ZCU9+sgNr
 Yh0BAARCAAdFiEEF8imOYKt0z8ot6DQeTBFn7kwMhcFAmnxxk0ACgkQeTBFn7kwMhdLbAD1GN96
 gCg17qB3On4/0NtIPQErZOBR76ZxwaB3tHyFaQD/UMxznwLdzHfCB5x0sV2RoVvlpHe64A449Jf
 LNTTJLVQ=
X-Developer-Key: i=casey.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47


On Tue, 17 Feb 2026 08:51:34 +0000, Antony Kurniawan Soemardi wrote:
> mach-snapdragon: allocate memory for DT overlays

Applied, thanks!

First and last time I use b4 review, the commit shas are wrong but you can find the patches in https://source.denx.de/u-boot/custodians/u-boot-snapdragon/-/commits/casey/qcom-main-13Apr2026?ref_type=heads

Apologies


[1/1] mach-snapdragon: allocate memory for DT overlays
      https://source.denx.de/u-boot/custodians/u-boot-snapdragon/-/commit/b7c1703b55cb

Best regards,
-- 
// Casey (she/they)



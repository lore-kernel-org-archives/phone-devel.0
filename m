Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AADF1AF0AF
	for <phone-devel@vger.kernel.org>; Sat, 20 Sep 2025 12:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758372107; cv=none; b=qJkeTMhZqknbpvBk0qXSAoXcfU9zn0sCynQIba18hUz5ERSFWQgK5Y9z+qJ7K/9NNdhbq4gWxz4YqcGL+3u5Pk55DEpxcQ5JzjI9q68LyTBc0LWU+XVvRgsjuwPtT8tVRVRjwkqcaVWJ+vIs2T6JXXlyAG3tiVlFnq995fgcvzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758372107; c=relaxed/simple;
	bh=U4W7SEmzfMZiBXjbVAuBoutJMUwsTyAz2g2xFTrVkUM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BDDnP1rJMeeNYFFrsEUWzqJts9G7s0uQ9tZpA53BtqVIW8IQV/vVtI6t5oxkhKShWcewtIV2yuCAqTtfM56P9go52b5rq7PryQ0IpMmTMZsiyrB+mZ/tQnE6+9QLBJwaCCcqEL2FirHPQPntuHR6GT6/ukPEU1tMTdOBDfEaVP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NJHjc/R0; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NJHjc/R0"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3e9c5faa858so2659492f8f.3
        for <phone-devel@vger.kernel.org>; Sat, 20 Sep 2025 05:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758372104; x=1758976904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=15ctJlWd5TiNnXgBO40s7vu6haL/vdED1g3JIoksqkA=;
        b=NJHjc/R0mNM6TL1I36561OKZvhG6AtyMfFPuAE1tcWxAppPJRAUYK0cfHATr8ySb61
         a3BgYNVK7yBkP39XRvBgQF+bYeFrjAjLKzTkQcI6Em8vWMKAgEXZQMl5PrdAW9qJuzJS
         YlfPENpQGt+OnkcO8g6ws67QtibyevPp1CuXJPlmTDH8pRfYQwVd/FM6umkbGQk5UD7s
         2SHzgS6b3ydXM1KBP/a0X/hCs/41fw1mG2rpkbr1Vt8zXqXUgv9mwdVj9RSRfEu8RzmK
         cUSP5vAgChiBUqvPmBe1aSuds4zPkCH3QPbBhpdnFXfautiLx5YuRPFP9/LPUNa1UE25
         BKHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758372104; x=1758976904;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=15ctJlWd5TiNnXgBO40s7vu6haL/vdED1g3JIoksqkA=;
        b=k/puUE65UoFt8nJL42XJCvk9o1eDZGiEjKuUcQySENRt/8UGL9p8HivquRvoB49AqJ
         J/qPbhikxbBGRSutDvvKz9ycq0G4FCYTZq/gh3hjSORGp5aw6EowJ3N8F9T7F2sPO2nK
         mhswILiQMPlXsY8/frsEWvdr8X4qPu6Bm8nY6op1Eub7yuL7P/8cHpsdhI9x9pF0UDh+
         nnd82khjn3qQYrwbP7Kg24Lfo5RKr1Iy1g+pHV/T0riohfbkXPGr7GKRjwgARzWQroru
         mYvRjf+2Wzj7K1+vyIpPVK2u0T5YkIWJkkNmuCQE01/58R5EyrSforX24GH2zSf/9lq2
         Q9bw==
X-Forwarded-Encrypted: i=1; AJvYcCUKH3IgsuBfhwJFRogVGvXZ6F/3hgX74fc3oaraPmR4eEkfE3rcTapInfs3so0xgxbPPcGr70dFTU+uwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg15ndjn0jR/h7+MG7xXiiV+aZ4Kpqoey7yOPM0bMw2/R7IiJd
	g6Jo/oWpkAnlMBQgM+T/LzXkw1gGx2K8wA1gI/es4FtpvgHUxSASKuXe
X-Gm-Gg: ASbGncsiIval0rA1s1thgyYSPysTnpTd5c0IbuEuynkjWzIW++HkUf2ckBVbPFeby/4
	D+i/BG/ApKQXyYqUasaW9iPRPzQdnAihWkl35U53w7mpvWAJQeOLwzc6NmXa2cRyPqWByfBdz5M
	HHoz1wq2KzXUcvffENWTst40aOVQizHRshDSl1gohlL1AndygtPXkKVDe+PVfYcReDIB689qX+I
	Gv8X3foYygIsmlCsgNX9+gsxNkL7+C6RooiqkzQBcyuKtR4vFw6j7dupXilAkbuJ0KWe5c6OJxD
	yPzxgi/CWqIV3OzzW/Hw6alFK9GfEGxFJZeiSi6v37zU1f+cKtEHsXsEqDZtnq8Dm2/jn4xV3F3
	c4fXcBaqCPOgqocddCJ1c+8rse9XojbrSOX/chcb3JqD66hdGY+mBNY3moqZ3I88GqoY1b08V6z
	3JxaM=
X-Google-Smtp-Source: AGHT+IEWFUq3RVye1lwnKV9/BW4Qg2WZ91sgKbGmwNaa5auZ6g4qL3atHwoQRVeYQ1Kh21j2Fa3FNw==
X-Received: by 2002:a5d:5887:0:b0:3d7:eb95:b1e1 with SMTP id ffacd0b85a97d-3ee83cabba5mr4475853f8f.32.1758372104261;
        Sat, 20 Sep 2025 05:41:44 -0700 (PDT)
Received: from Radijator.localdomain (93-140-182-131.adsl.net.t-com.hr. [93.140.182.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-464f0aac271sm122747095e9.3.2025.09.20.05.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 05:41:43 -0700 (PDT)
From: "=?utf-8?q?Duje_Mihanovi=C4=87?=" <dujemihanovic32@gmail.com>
X-Google-Original-From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Cc: Karel Balej <balejk@matfyz.cz>, David Wronek <david@mainlining.org>, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
In-Reply-To: <20250913-pxa1908-dts-v1-0-8120cdc969b8@dujemihanovic.xyz>
References: <20250913-pxa1908-dts-v1-0-8120cdc969b8@dujemihanovic.xyz>
Subject: Re: [PATCH RESEND 0/9] samsung,coreprimevelte DTS additions
Message-Id: <175837210249.5177.1897822800832448116.b4-ty@dujemihanovic.xyz>
Date: Sat, 20 Sep 2025 14:41:42 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2


On Sat, 13 Sep 2025 23:21:02 +0200, Duje Mihanović wrote:
> This series adds some hardware support for the PXA1908 SoC and
> samsung,coreprimevelte board which has accumulated before the initial
> support series was merged.
> 
> 

Applied, thanks!

[1/9] arm64: dts: marvell: samsung,coreprimevelte: Add backlight
      commit: da8cd97da58ac1bada6384eb7327de2502e76b03
[2/9] arm64: dts: marvell: samsung,coreprimevelte: Correct CD GPIO
      commit: 37780045c78d0134373c612ed5a6cf18a1c77ee2
[3/9] arm64: dts: marvell: samsung,coreprimevelte: Enable eMMC
      commit: 4a9e21b88c9a6bf3afa68d9a3eef8c72c53a69f6
[4/9] arm64: dts: marvell: pxa1908: Add PWMs
      commit: b7061793892ed1e947d65a53510dc217411bbea0
[5/9] arm64: dts: marvell: samsung,coreprimevelte: Add vibrator
      commit: 1c01dc7da1ca9ddb55cf35a7b8baa362ca393787
[6/9] arm64: dts: marvell: pxa1908: Move ramoops to SoC dtsi
      commit: bce8c4671a45d9fc8d0f4539ed758a1aef9e1aa8
[7/9] arm64: dts: marvell: samsung,coreprimevelte: Drop some reserved memory
      commit: ef2ec06ed37e8d6134b2df28ce123e7a3096076d
[8/9] arm64: dts: marvell: samsung,coreprimevelte: Fill in memory node
      commit: 01bd34653bfc17679e04a7d554e9b7f917e1b3cc
[9/9] arm64: dts: marvell: samsung,coreprimevelte: Add USB connector
      commit: efab3844c6f18327886c5c2e0e40acccaf976a89

Best regards,
-- 
Duje Mihanović <duje@dujemihanovic.xyz>


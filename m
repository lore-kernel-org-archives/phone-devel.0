Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD72A28003A
	for <phone-devel@vger.kernel.org>; Sat, 13 Sep 2025 21:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757798487; cv=none; b=UXPpyCevYuGFunqhB76wIEX9tXYta1gLnUVTszN60y0pcZ3MKhE1lQ727c5QZmE8tZ6JbMhVyqMeJOP/LDSXlJdF2aNQprTrBy83cR83/5b8o8iWgyH6bCe1Kf3uQVW9icK9ygetigrIE87eG9uQvpJPaMQR5vfFF1oy4QwgYVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757798487; c=relaxed/simple;
	bh=TYNRK4+bphtWM7te51Y2NO2PW29CFLfANZF+pOwh/qQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XERt36TSCrHhP6JH2C1TBJctvrk5auis/3S7fF7iBd7tIb1QS8w/sLc2KB9D4nGgBjThAnMQxFwWy2wLPUR6CEO5Crgfien4WJcxBAFla+8MW/qu+3502U9D5lB/5x6k9ApU11M+OZxKvEdnMMfwC+WmDV1EtDufl+0NFkEkbMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eCixbt7L; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eCixbt7L"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45cb6180b60so20942335e9.0
        for <phone-devel@vger.kernel.org>; Sat, 13 Sep 2025 14:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757798484; x=1758403284; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UUfEoumCbzIEx8AGvj96Z7JPRJbPQvAkGwx1CilBgwE=;
        b=eCixbt7LOfEiH+E5nkfZgb4/8nLdEDQTSesLwxt0ZVhx8Ng9bPN9Py8eC4Ej5DLt29
         UeJdh5Gfc/foh5++YOHuousrgQOWpnO9eyPuo0uKs4aZKdAS8oZhRB7ySaQvN5tAcH3T
         HP1x427+quB6qwnpkqdAn9WgF179YfFELVdFLFZ+gDutnSA67i/3+jZCVcY+F+f3fsTk
         KbV7kFwFvzZYX8DyIKk485iXapkza9+1OHysvXLyUCedSPs8yOyf0yMG5IFLwtZ8cdNS
         1wEzHME5gUgPL6N+f9FzsQiNwdTKnJpUKr7VFrAKnOXTfZD5fLBvhXTnR5VPK+L9qRdG
         oB+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757798484; x=1758403284;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UUfEoumCbzIEx8AGvj96Z7JPRJbPQvAkGwx1CilBgwE=;
        b=v2An20gKBsYAJ9Oxeko7YTh8mO6lekHrEFE2uLCKtrdCg/RshGTbKHuY48QjbJy8b2
         Ck1OxxG0GjI6TH2FGNRJtC46+44ET0g1fDPHEjym5N/8pKoa59aWumiNDepaGNPkiTVV
         E1Ygrrx9UMOecAQeAKR/rD0bjhguW00zEnKEgOmOCqQrKEhQRgolaNjoVV5vLW11u1/B
         MksQ93IXPYkQSIo4SUdf1ZqetIodGb8RTUPgjQUsI//facfahTIOiUypnWIHFHI62Pf8
         6QS8Wd2x5eWBs7JhjLdJGNS7CQ3+JN65PehxOk/eSGXbpH5nK8LfKm9QWfcWtXcSO/n5
         KA8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUeBZ+Y/hmiP7/8LCq1BU9fvwo1HcyyQYlMDj09aUcnxUw8tEMph8hxnE9kAcDe2cNnDG+QILrLlZ4ukA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSXVsP/znDtWYjI9jzU+8s1Nn/ZhDZoEvPSzg+qvJZi5kv0lyG
	8gzzZIgUIefROXtBcFTqTDSaLOfzlQ+goBCmBxkRNLrCpxOICyvnLBts8skInQ==
X-Gm-Gg: ASbGncuGgu3GKrEf2Si+NPfZLcGYLfvoo6+VCFZBNC73eOnTRjdFNq5l7vQ2uNkSZO1
	9zEjSAnhlddIKS/kwFKHyx7Hc+NcpoUgdAeBupmoUK5xg43dFZVwaH5ovjsaYyeCBOnfCbeywE2
	6mTBC9AwlX2O3pq70zhvxu0BpUcSJ/kyP5450Q0eUJ8s017QlaLlV/pntz2YWePIXcPTKs4vAOM
	0Y7qft/zKN6FCHIHGU01FGZw3nMt1QHRWd3pM8jtJLEpz33ujgoiNYsHgVGqKEdmIJ//GktnlIV
	+e6XO+D6c9gHKVgMsH0KOObqlCrlI3sokiyCAOL73VeBZyKRyp+NNnwa7FhOjz2VOWAxNYtARyj
	Ncmg7WMxHP/I6wQclmVY62/s9UWf57Q+Q0LWYJa9wL0Je9Ao215Gy
X-Google-Smtp-Source: AGHT+IG1Lbyz/LuhSCMvFaFvWIQA+e+oeS+V5WfPI22yr5MxxdIQ2TC5LggKVWnkSIrVed1aQHOliw==
X-Received: by 2002:a7b:ca5a:0:b0:45d:e0cf:41c9 with SMTP id 5b1f17b1804b1-45f211f89d6mr50232345e9.22.1757798483764;
        Sat, 13 Sep 2025 14:21:23 -0700 (PDT)
Received: from Radijator.localdomain ([93.140.65.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607cd6absm11576842f8f.34.2025.09.13.14.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 14:21:22 -0700 (PDT)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Subject: [PATCH RESEND 0/9] samsung,coreprimevelte DTS additions
Date: Sat, 13 Sep 2025 23:21:02 +0200
Message-Id: <20250913-pxa1908-dts-v1-0-8120cdc969b8@dujemihanovic.xyz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Karel Balej <balejk@matfyz.cz>, David Wronek <david@mainlining.org>, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1213;
 i=duje@dujemihanovic.xyz; s=20240706; h=from:subject:message-id;
 bh=TYNRK4+bphtWM7te51Y2NO2PW29CFLfANZF+pOwh/qQ=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDBlHH/jV+J233T/1YRr7LA/+q+zzuV2uNy35qlfiltS9f
 7PmHwmdjlIWBjEuBlkxRZbc/47XeD+LbN2evcwAZg4rE8gQBi5OAZgIexPDXzGZg+FHP2t9rNgW
 nql9ZntQ4APjT2v3POL9smtm9o0HgUwMf2Wkwv6F2M472b7v/66Tv1cwKEc9YfYV6PBy/Faiyt6
 1kBUA
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03

This series adds some hardware support for the PXA1908 SoC and
samsung,coreprimevelte board which has accumulated before the initial
support series was merged.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
Duje Mihanović (9):
      arm64: dts: marvell: samsung,coreprimevelte: Add backlight
      arm64: dts: marvell: samsung,coreprimevelte: Correct CD GPIO
      arm64: dts: marvell: samsung,coreprimevelte: Enable eMMC
      arm64: dts: marvell: pxa1908: Add PWMs
      arm64: dts: marvell: samsung,coreprimevelte: Add vibrator
      arm64: dts: marvell: pxa1908: Move ramoops to SoC dtsi
      arm64: dts: marvell: samsung,coreprimevelte: Drop some reserved memory
      arm64: dts: marvell: samsung,coreprimevelte: Fill in memory node
      arm64: dts: marvell: samsung,coreprimevelte: Add USB connector

 .../marvell/mmp/pxa1908-samsung-coreprimevelte.dts | 157 ++++++++++++++++-----
 arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi       |  46 ++++++
 2 files changed, 169 insertions(+), 34 deletions(-)
---
base-commit: b320789d6883cc00ac78ce83bccbfe7ed58afcf0
change-id: 20250902-pxa1908-dts-65d86a5d2d85

Best regards,
-- 
Duje Mihanović <duje@dujemihanovic.xyz>


Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1050734F27A
	for <phone-devel@vger.kernel.org>; Tue, 21 Oct 2025 18:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761070189; cv=none; b=g2jYEBsRNrJ5oNvBIAZL9ek3Zp0qlFgIF33SRdkbL27LnQogs0YewM2HvFbOj/ipL6O3IVw+Mty24Qv767g67H3ObYUpLXjOoaUEnkJyPT6X+BGlCaePWR5B3rYC1Y4REn1XeWKZxWBBHQ6HC/ZT8CU7RjIA58XrRbmDjanrsrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761070189; c=relaxed/simple;
	bh=aRp9PLA2Ky1tVA6uHK/HKcddWUGAl0+QPgh6k0eSPvg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=A2956vYrf1tB4KLoSGubYBwRb4Uzk4S6L0y0IKriV4w8rUIN6yCB4ghbxbEUDxmG+efC2iUrHSx8KssNtnTRX8lIljp1iX51CPYITlgA8CXqCr9HRNPmS9RDYHxFcawq6n8Rs0CFnps3qUhQVa8NSI0ol8uZuNYryJ7+UZxjz9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=qw5BLrfu; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="qw5BLrfu"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b5b823b4f3dso1130298766b.3
        for <phone-devel@vger.kernel.org>; Tue, 21 Oct 2025 11:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1761070186; x=1761674986; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ruRUvdvkZoLr2jJW0Z1cLwXXKdDFMs/zL2a1Mukfk9s=;
        b=qw5BLrfuRyqVv/RI69PT48U1aQMImgHG4w+IxtLVGQ507YWzAkf/bbWVpcmuHRJBzj
         K/Vxu8mvoIWV66ccb3pHFssuCO1P6Ominbff4HBiJfYnv++HhDU+M98uuD6UOr8D+RLX
         oX0nsuf8KhXvVQJlGjvb7gPKjKNGk1WtKBMrt+Jjo+N/yrJgB3CpMUoLnO2emKkHm8PB
         C7k/qkEGSTeoxabXWNsYdx6oUiVHVqluN2+SVLWiQG6GcU0pZsswroz6rJC1L3o7APtd
         wos/GbE5AL8udIAcGT9a0k7vueCaQMSkDi9f01o2hU5vdB62iztixttAr52d4dPcpT6u
         oNpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761070186; x=1761674986;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ruRUvdvkZoLr2jJW0Z1cLwXXKdDFMs/zL2a1Mukfk9s=;
        b=oo8eL2Haw7ov7kx9jCZS4YOv+vL0UsWmGevVJQ6FXcDivka6P7vIYWFmn76aaSK9Y/
         ac19/gm3S80FbFZb203nMpZDMLLAoKDvgFovES7LZDQH8c0QZIaY7jcaPxwtdKkO4CpB
         li9T0mZFKGTirJhBrEI9LUmkfXzMulEWdn08T/n9bMGvb8B/Kx0AL1FfHsTO/Fd68VYk
         sbqFGuJrhI4WSH5FYOCNrlnW/i5qgwOB/Q4hODB6ZdA4vLLjpSwOynihvBLaIDWRrk7L
         6YBjwL4xIcXI7+S/mI367L6T6/SF9gQik5UJdNwQDAHA+CivGDMLcgnVkby/fKHGE6LW
         zVrg==
X-Forwarded-Encrypted: i=1; AJvYcCUu2UgGaqtmzJg04Dg6EneRR4ofp2bkTXqyuOouZ0Z3ScuOjMyJZHYaNJOL47v48rK6CS48E1vqnTlQ8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGqZrN5Xdx3ay8uFEZ5epPKDgRcLNoZxLJGvgeaHQWh/N2l7vE
	XAh1vQNAJgC3NJ4MZcqNGwct3EoVq7Y9PifShR6H4FqarYiA/O+uMoHYjLlsJj5UhaA=
X-Gm-Gg: ASbGnctWoEK9GsMHffem4UbYrhpvPU5C/WlUySJeJK9/x/HPPOzfWfniQad9TQEIWTo
	LmYU+Cn9MdpgIbrKCRJSOvSVvy4yi0BfSAS/NryZAQVn3lm1N4AkOF7/tGzLMP3S1jQIhiIy9Zj
	q6+1QvMn4CamTlhQIMrkooAPEr+aaQpSGtsMKT2nX82kEEdiufPYF5GfkYhxoS4ITqGtVLkLxkJ
	OM2HXHzllUe4K8CIrxtFyhhUcBKcmsIe8P0ErjMCAbmlt55BZcQUuac/41xKfbbM8hAqNWjZdTn
	RPr0BH4qLIS9bno2tNon+w2V8dc80GwpYZmVf8EW7kwMNSQEyX1cqyGwZxz65kGmcVXK8khM2AM
	EYI5LKD0UD8hrE3pAMyOHUEHtUt6X29fhBdv3BQLV1o/Ba97V+/XGK7hpcTpYiyrz/nvf7ThvpD
	tvBgjMKblFfqdGyJywcA==
X-Google-Smtp-Source: AGHT+IE5avVzpvShmbvSnzjVvBNOm23bDLEnbiX6D+4Il8N66SDi+tTOysqbM0IZc2AcphKPy6ifOQ==
X-Received: by 2002:a17:907:25c5:b0:b4b:dd7e:65ea with SMTP id a640c23a62f3a-b6474b365c0mr1913226566b.35.1761070186373;
        Tue, 21 Oct 2025 11:09:46 -0700 (PDT)
Received: from otso.local ([213.208.157.251])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e8393778sm1116758166b.24.2025.10.21.11.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 11:09:46 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/2] Fix Agera PLL config of CAMCC for SM6350 & SM7150
Date: Tue, 21 Oct 2025 20:08:53 +0200
Message-Id: <20251021-agera-pll-fixups-v1-0-8c1d8aff4afc@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADXM92gC/x2MQQqAMAzAvjJ6tmAHKvgV8VBdnYUxx4YiiH93e
 AwheaBIVikwmgeyXFr0iBWoMbDuHL2guspgW9tRawnZS2ZMIeCm95kKOnb9QnYdqGOoWcpSzb+
 c5vf9AGVVLs9iAAAA
X-Change-ID: 20251021-agera-pll-fixups-dad6b12c715a
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Danila Tikhonov <danila@jiaxyga.com>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761070183; l=921;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=aRp9PLA2Ky1tVA6uHK/HKcddWUGAl0+QPgh6k0eSPvg=;
 b=ZZm6/NmPI1u7xNg8IcgQWaMv/5laGL+vT63Yqr0y0G9t5kzsMV4D43xY90DReDodb7sG5F7Ga
 lYwR2fsKLeEAlTe4FrguUevMwr8AIOwddbg+Pd5SurfbMzZ1i0MXvEQ
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

On SM6350 I noticed that CAMCC_MCLK* refuses to turn on (being stuck on
off). The cause seems that PLL2 (of type Agera) is not configured
correctly due to the implementation in clk-alpha-pll.c differing between
downstream (e.g. msm-4.19) and upstream, and therefore the USER_CTL
value is not configured.

While looking around, it looks like camcc-sm7150.c has exactly the same
issue, so fix that one as well.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (2):
      clk: qcom: camcc-sm6350: Fix PLL config of PLL2
      clk: qcom: camcc-sm7150: Fix PLL config of PLL2

 drivers/clk/qcom/camcc-sm6350.c | 6 +-----
 drivers/clk/qcom/camcc-sm7150.c | 6 +-----
 2 files changed, 2 insertions(+), 10 deletions(-)
---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251021-agera-pll-fixups-dad6b12c715a

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


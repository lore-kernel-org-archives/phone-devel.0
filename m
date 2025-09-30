Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8A6264F96
	for <phone-devel@vger.kernel.org>; Tue, 30 Sep 2025 13:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759240640; cv=none; b=oaEghtx8jdN9bA9fmFgaAgS3Pp2Q7BgcrfSIoB1EfEq7FjSpkgepWpKpzXPHmXmZ3RZokT5n7zxO6X5PYrBc472YJU5ydgpOqnEQ8605qi0ajikEOom+P4np4So0n7h70gRBq5zK1QJkdr8Bdm9ZAqWJfBx8Y7+eWDA2MJJbFUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759240640; c=relaxed/simple;
	bh=LvoK/fU0u4wr6mRtgdT7avBiMc754iRAL/avyJ7a/+o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pEKXUo5loWM/dFHtjy8IIP367PYQgMcXfj+F2joAIL1eJevP138xYGMGW99RUx97aHDcysOtkESJ7UfxzFgPC9lXXy9dgTBRe5++ahp9u0Z60RzcicqeLdxXp7k32GW2Qwz5kgsOXjBuVVrRmjq6tgiZG8Ywmq01JQfawNBJTJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=NzRhiqGU; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="NzRhiqGU"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6366d48d8ccso1143669a12.0
        for <phone-devel@vger.kernel.org>; Tue, 30 Sep 2025 06:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1759240636; x=1759845436; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eUr7vsKJmPNDRIs20r13nEz41hFknG/qraXbAKvVO/o=;
        b=NzRhiqGUDh498dEWpEe7rKJ8/3G5f0O45Ju5nXQu28UNz6wUWgZc32wWrw6ZCerq9A
         VftOqfCYplEWDsrfelFkcMxptOPlsxZX71A6pTaXtiZmSZD0D9WZFJtPgM6LURLCGS9e
         XJ1xZ7wDZN3Kvq2/WYK3dw2flt52Flzv7ybWZyHluobf4GfaNSHM/AtQ7js5CIz8gtU0
         EMHC75owQcZRd6YVhQlfbkf1aR+ff76LiGZ121W+Xhuk/ow4QAG68FNLkTMWT3T/SZNI
         yGgKrlgpN3vedgN5OdTFm0nUSHsYNIKNg52h5fzFgHvhI0tFaRHZhBKPMKrtvaYjNb71
         zQ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759240636; x=1759845436;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eUr7vsKJmPNDRIs20r13nEz41hFknG/qraXbAKvVO/o=;
        b=A7/iAfmjF6N+7e+1a7K9KX+jfQKjfqmFaBSsSzP0NgNx3nQCgUsm598MMijZlVdzPz
         Wih76R54dRc0vrrxXsPxFJON3XiaAdKmUjlykEgl2EWhxQXQVY4/1tOEKuuqgHNowntl
         5JPD51y1uLRA5ZSRLC+UltHjszW273rchChKhDfs7gZH7nWz3KsNYvjIZ9uGoAlO6jVF
         FbnBw6ZvpTi8gd5JuXpGk6yPrGidRHDKS9A5TQ6LqLYfYRCV7jnR2Yu/uMs+6n0mQuVh
         ILOl4X7Lo1P+KlL+xy8zxo26tFLQIwsTXlmJptXI/cARDCwA+91JPr3qoYYKnrW8FR82
         qnVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVHrKg+pdRjXlAQp/1epJ3tD89pKFC7Qb4BsVJ/ZjKTk7q38zWxCE7Ynin/wq79D4PZK43jvR/CPcWYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwVNkHeCkAZFUmXUprfy4CV1IIniFkydjveWeQn4hKByj73ZXX
	eJwHkgYiDhBn7LvZVo6XA95HV3d1vLYWQjwUmPZBHu+hIe53YC9t9bIVjxoiR9s+7zo=
X-Gm-Gg: ASbGncvESws4o78joNGQyVQHipk/3sVv3OYzfqnrrjUjmUYnkUXQj6QFOju+x3Mb00J
	lfdKr/GE7zyv5S4JJdTfLnX9G8OhOJUp8YLHD7jBUFyKc32aL6+m3kMxCdZebrK48JisGbQbIek
	Xc4Trq2MUkIC4fmXNBrDEPZV4qNHGV6Uu9xVIFKzY/O/un/Fx1HDKnWxnK54tuiwKq8j2XuiHIk
	0sFD44jwv0+evvwXdJcIDWz+ypErOCW81WJfWTxOEFNpCkyDsmibmEsi7fWNACSr81hhsDYk+R6
	NvULX7ST6rn3pgPyIOm1OLImPbadSzSo2XARmJZaWTRuj+Rz4jL156ij2Aj+thYvMui/nQ/8Inf
	bO+vy0X3d7SBNzD/inDehgiVRe++jn2kPpigSaKU/P78E759tG9XTBxIrLEdYEMA/0qM5y0D0wM
	L+C0sPwN96bLWmQKItyQ==
X-Google-Smtp-Source: AGHT+IFYeOgKWJT7YPQFm0YeDty93OJbZCiOvEyhMTrBgicIfyRCh7ByvycGfhKCy0N/oNg9ro2maw==
X-Received: by 2002:a17:907:948e:b0:b3f:1028:a86a with SMTP id a640c23a62f3a-b3f1028b47dmr844768966b.3.1759240635975;
        Tue, 30 Sep 2025 06:57:15 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3fb818fb90sm370234866b.63.2025.09.30.06.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 06:57:15 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/5] Mix of dts fixes and improvements for qcm6490/sm7325
 devices
Date: Tue, 30 Sep 2025 15:57:00 +0200
Message-Id: <20250930-sc7280-dts-misc-v1-0-5a45923ef705@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKzh22gC/x3MOQqAQAxA0atIagNxVFyuIhaSyWgKFyYignh3B
 8tX/P+ASVQx6LMHolxqum8JRZ4BL9M2C6pPBkeupq4kNG5cS+hPw1WNkWvvqQocmoohVUeUoPd
 /HMb3/QCizpx1YQAAAA==
X-Change-ID: 20250930-sc7280-dts-misc-c5dd04fcf74c
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759240635; l=1094;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=LvoK/fU0u4wr6mRtgdT7avBiMc754iRAL/avyJ7a/+o=;
 b=H5yzZH2WkXZYR+4lSp/dVFM49LH1oXDP4ygon7l785TAFzcmY8soqxtCdDZ74m6LvtCG+dBhy
 YRiXQCs2xCwDBBfEKWtUQVlGYrtt19LUwP9/KRphLv+OUW4yWD0tlpi
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add some fixes for Fairphone 5, and use correct compatible for
lpass_audiocc for qcm6490-fairphone-fp5, qcm6490-shift-otter and
sm7325-nothing-spacewar to make sure that driver can probe.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (5):
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add supplies to simple-fb node
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add VTOF_LDO_2P8 regulator
      arm64: dts: qcom: qcm6490-fairphone-fp5: Use correct compatible for audiocc
      arm64: dts: qcom: qcm6490-shift-otter: Use correct compatible for audiocc
      arm64: dts: qcom: sm7325-nothing-spacewar: Use correct compatible for audiocc

 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts   | 20 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts     |  5 +++++
 arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts |  5 +++++
 3 files changed, 30 insertions(+)
---
base-commit: 3b9b1f8df454caa453c7fb07689064edb2eda90a
change-id: 20250930-sc7280-dts-misc-c5dd04fcf74c

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


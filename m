Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75332EFD9C
	for <phone-devel@vger.kernel.org>; Thu, 20 Nov 2025 23:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763680273; cv=none; b=NdUX6tK4OOLAfyorXvqzExQBe94gA3/O2o8lFQ31lvcmPN6pF6/Oap5v4pqpUEcbnEOLm7lsIVgcDof6JFWupEJQePkMivPMeV6cIw6uKiaHf+c9Sny/txG3UsyOZCpvkFGZ9S+H711YcL/LG9meTU2h8R0hMws5C4HL2MEBUVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763680273; c=relaxed/simple;
	bh=f09Ph1eIgetZWHLJK7FoNd8ccKR+tymPGV+3sp1g5K8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KSSwvIzM+ByCUND+5D1AIdAC8bAJRHpeqrInu5NggZL4S8nRQRI8Q/HewWtoin9r0gaRSQTM9c6oazpMMfG1f4IzkAUSRYlhcg9rEkxOWxZnOgQh65SOQScgE44qK+re3kH4H0zmL3IkjScyreGrRNskT0d2ag+AETMYIvzw0rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iLsnBm3H; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iLsnBm3H"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-78802ac2296so14994987b3.3
        for <phone-devel@vger.kernel.org>; Thu, 20 Nov 2025 15:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763680270; x=1764285070; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OIBL9zhNeDx90fnwrwztaJK024OToElBIomfLRD7cbw=;
        b=iLsnBm3H5b/SPaiMATkAyU7mViaLc8kVHebiqeI0wKMK7svUPKfIE/UwEDOF/CSwQU
         XPGDCU3zhIEWogtX06y2lW1n6YQGDHlZSreIDTW6pGukl5VSLXh8eoOd7WwdG6aLueZR
         Vaa4AWWJ/ySaDyR4Qls1iMtNOxJpjhrh25yJu0xLGWrFurUgQtgSDapUe0/5I77iypl9
         1Ydi9HXTsrbRA7N3XNNJVN1tmWL8Tjrq4YUv8vUBZ2qYzHnDs0NgJJBCWI4SiyuDnEAI
         5bM9w6aOVRvS8vlPYkzONWBQLL3H4ZVyxKOyIOF6giuGFp9z3EAbAwk2NZg3nRWEr9OZ
         +71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763680270; x=1764285070;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OIBL9zhNeDx90fnwrwztaJK024OToElBIomfLRD7cbw=;
        b=tdGXM8iBUfIa6suQXopnuw2GsiPzrIjcMThy4IDDFFQDHG7v3a3vYGrJWhFCwOaMan
         iscgFHYK7QhQaqMsReW81gMhoYi0HVKfG0E3lE4ea5dqp8k6K4OtTNp6NP4nZZpM0BMn
         MEA30nHZeL1YxNXP2vzNNidlG4ibUFjWu7GtlYfR1zHQOZoNYhJhh3t3sggg5qrgIYdK
         9I5lnB8NUBYe9pO1l5SStGSQHf9EzSTR6fvkuGAV569UiKKvWM78ybpVNiOP0hqAMhaX
         DBYvIK36cJkcswJJm1biXv2CsoE5sXYPEmknjH2OPg/pKe0rw1DBr8qk4Iox748JgXy+
         eciw==
X-Forwarded-Encrypted: i=1; AJvYcCUOFHTck4arB2C0vumYQlCPzNN8zhWPuxsy0C3mpy6h9zrgMtsgLNeQZwLGJqxk0hE6B55Iw4l6BBpq7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSs1mJIUIeo2LyB6BwGaftC/SVeNYyYgIaC1jGUeWg/T9w67vl
	4heJ43e472VMVUD6DuscDEYoFP+XFGkYkeHSyZFV06l0fg279lTvKSvC
X-Gm-Gg: ASbGncuL+nfxdsN9RqZ9LiwiK+HdiJbdQOwIU0M9yFK/xYt9rZIX8ssxUm4vqkxWy3t
	FKURUyIyOxFp8BPZaZm+Sv4pXHc1dpH3FL1XmvcV3e39ZxD6OA54DrqMSSjzoWKOun5BoPtUExz
	+yWNCasB5ygiEcbtn5MFNvoDbR9x4fJPV0VRLe+tVwWuemr7daEXr2/cpzRp9ss1k874MjYosnb
	xGUbZiY8WAb8hILLerbGtKk/i0YCc2mPqptfXoocSBCnhDvp84MCMF1aSfnff2FdYdtxjquet7l
	GMlBdvj98T/sf3auS+BrK7m6NI6WB2QAd6kl2SeYebxIyxIALXAu7EnB0rRxtKaeZ2HL+0NsgTL
	CcUDvXJN0Ph7sjyqVN4QVKPTyLB1HJe6Tcoj6ZYox/bOE/+DyJ2K2DjG6XKqqGE4FNKgaLhjZxf
	Nr2OrkY7pM3eUK1g==
X-Google-Smtp-Source: AGHT+IHQW4azgv81UpzbgS0IYJMpaV8AqndCImbd1VY7yIzNWeXySfqUd/IcqRYt3Qox3ks+I9+JOw==
X-Received: by 2002:a05:690c:688a:b0:784:841e:c044 with SMTP id 00721157ae682-78a8b5672ddmr904707b3.59.1763680269837;
        Thu, 20 Nov 2025 15:11:09 -0800 (PST)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78a798a7f19sm11356807b3.20.2025.11.20.15.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 15:11:09 -0800 (PST)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Subject: [PATCH v2 0/2] Asus ZenFone 2 Laser/Selfie includes a battery
 measured by voltage mode BMS and a simple GPIO hall effect sensor. The
 following commits include support for these components.
Date: Fri, 21 Nov 2025 01:10:47 +0200
Message-Id: <20251121-battery-hall-v2-0-d29e0828f214@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPefH2kC/3XMQQqDMBCF4avIrJviRKLSVe9RXCRx1AE1JQmhI
 rl7U/dd/g/ed0IgzxTgUZ3gKXFgt5eQtwrsoveZBI+lQdZSIaISRsdI/hCLXlfR1GS6yRjdSgv
 l8vY08efiXkPphUN0/rj0hL/1D5RQ1AJV38q+GbGz3XPeNK936zYYcs5faFGvgKgAAAA=
X-Change-ID: 20251115-battery-hall-30eb7fbba62c
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.14.3

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
Changes in v2:
- Reworded the battery commit to include a link to the downstream code
  on which it was based.
- Separated hall sensor pin configuration from gpio-keys.
- Link to v1: https://lore.kernel.org/r/20251115-battery-hall-v1-0-1586283d17c7@gmail.com

---
Erikas Bitovtas (2):
      arm64: dts: qcom: msm8939-asus-z00t: add battery
      arm64: dts: qcom: msm8939-asus-z00t: add hall sensor

 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 43 +++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)
---
base-commit: 0f2995693867bfb26197b117cd55624ddc57582f
change-id: 20251115-battery-hall-30eb7fbba62c

Best regards,
-- 
Erikas Bitovtas <xerikasxx@gmail.com>


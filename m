Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B3E1FCCEC
	for <phone-devel@vger.kernel.org>; Sun,  2 Feb 2025 22:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738536373; cv=none; b=gjOqxRHpyUc0AD8CTkuN8GksCiknek1RLb0PhQNKEikzhRAYMgspCbXdoa2SqJyJc8gJ2FxvlK3sfDFiobTSYRHaXDRJStpUBpZrr2EJshsq1mcmRGRNW4MguKB85uyMqvjqNDzjbPBNX/xlzt8z52GeycpVspnCK4MzAyne+NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738536373; c=relaxed/simple;
	bh=AgL8Vh4o01HqqDUJ+cWv0Odl6D4wHVO6sMsIgzd0wkE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=M93yiENf3NJKKMq5cBcoPjaGM9RFqtgIZxoihr69A+RrYtcE4yhTyOz32KQoMtwhAEkmgX+TSys5TAmSMOaXz4sZQMypC4jYkti/8JGg4mgXpimh6ea/J9jyJLJsqHW2GPHXQGkKLJts9rf5jGgyJnvJl5K2PoOD3qnnyOS4uys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=fuN52ii/; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="fuN52ii/"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-436ce2ab251so25648635e9.1
        for <phone-devel@vger.kernel.org>; Sun, 02 Feb 2025 14:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1738536369; x=1739141169; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YMxp+N8AKPgVkLLt+tNd5Z5gGgVjKJ6HI6C9QfMvPDY=;
        b=fuN52ii/hTOy3qleFmXOZlsz7f5wuimSH6LILVnaC6e1QCacxvOPpY++PV6hls7bLk
         Q32pjDUBgMdoW/Pr8hqLHyHVFhBO7co62VBmpxuvLULCK8XRV6Y/ijrB5NnI5eTLX1hu
         5MWFVXJE0meVofQLwE4e3o2D3rGrWqKOIWB0+h+DV0jFMGvaVeAs1pCf9YcNJj4xB5pp
         W4kpnBgEns5tslGl6WLlwZwKh/kDNoJ3CLszjCKVjgz+LDyXmvA/v3ayCVWNs33KukfA
         0PTovCGWx2H1v8//xLB70WqV7pqNzq2386ORQRIX9mkSB/iaNDWmxis6hBehMRrDw0FF
         pUTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738536369; x=1739141169;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YMxp+N8AKPgVkLLt+tNd5Z5gGgVjKJ6HI6C9QfMvPDY=;
        b=YFl1R/lpovA8Mzr4jA4+xxuj0hcEYUkmBUt0ix5OQOY6WoC6RBPn1WYMTKjwSc7l8m
         PnfQHh6gdKIP9geMd45hS9ewwqMmgz8ONQOfVEu1wd451m+4vez+2FGcplyo1oC7v0pv
         9c7R5mD2R2MJQghWvKOi6XNg8rZga9F1HPRRkmLngKEZz+DAjnqwh6ckCm+jdEOBGAOr
         wEQYVsQO19kc1N0fl32TzT9RwHc7ckBZX+l5TMWGbC0czTe9vVePxPP06ntam1JUZefx
         9qGFeANNu4Ifz04FS+rsuTJanzI1eOIaX9qLTT5BUFzCbcfhlanY1yY6Aju9F4tC8eA7
         OTwQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/tT8TLT+vci6nMi+Xf5mldi5Xp4NMiJGhvoqzgekzYzMgDb45SpJYPWown+QoXmU2xtgIzg7gphgasQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YynAx38NzwmVL1dfM7oPirvPP5V/9vSYw37NOIpV7qmMLYIeezl
	cKxmOYFDnDaHZhnB4P20E42heZgzUVVYdOFTiUuShdeA+SYyCMvP8ta0BNo3w+w=
X-Gm-Gg: ASbGncs0SYBfO6ENglq/QmvjDL1JwIBPOMowsu0ThSVzt+7TLPEp9ZDxljCfpeTj+ap
	kJLLF9EwPfELFedQvmALuLdPLykQb62N/w5NU+yIt8lUMFRXwG6O6xzujsC96D4gaCmW/OJ+FYb
	OCIYwMs0srQBL36QscTezF8W8y0HLhjFtlIalr5bpgMaDim9Lxfz5WNM6TMOnIIEv+8LqOwHPXw
	uP+7ul9hNdhlnjUqjsv27EshNPvz58QtGxh4tiuP3QlglT503PaRf36RbyJELE0U2wRxmC+pe62
	1soiD/zauVVypa1O+0QxPskwVVs=
X-Google-Smtp-Source: AGHT+IGcFZzU17tuXtMYl8AEybTSN0illAVTYf2xaoCzTK9YBwUnEwlsFBobc6i+n1sl9bjYkSI4Bw==
X-Received: by 2002:a05:600c:3d9b:b0:434:ff08:202b with SMTP id 5b1f17b1804b1-438dc3c360dmr159424395e9.12.1738536368984;
        Sun, 02 Feb 2025 14:46:08 -0800 (PST)
Received: from [100.64.0.4] ([2a02:a03f:6bc3:6b01:62c7:350e:556e:d0f0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc80e61sm170849605e9.34.2025.02.02.14.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 14:46:08 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/2] Enable panel and GPU on Fairphone 5
Date: Sun, 02 Feb 2025 23:45:50 +0100
Message-Id: <20250202-fp5-display-v1-0-f52bf546e38f@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ71n2cC/x3MTQqAIBBA4avIrBvwBwm6SrQQHWsgTBSiEO+et
 PwW7zWoVJgqLKJBoZsrX2lATQL84dJOyGEYtNRWKm0wZouBaz7di7P15EnLYCjCKHKhyM9/W7f
 eP08/RqZdAAAA
X-Change-ID: 20250123-fp5-display-75cece20d3ef
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.2

Now since upstream DPU driver can use 1:1:1 DSC topology, we can finally
enable the panel and GPU on Fairphone 5.

Depends on https://lore.kernel.org/linux-arm-msm/20250122-dpu-111-topology-v2-1-505e95964af9@somainline.org/

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Konrad Dybcio (1):
      arm64: dts: qcom: qcm6490-fairphone-fp5: Enable the GPU

Luca Weiss (1):
      arm64: dts: qcom: qcm6490-fairphone-fp5: Enable display

 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 102 ++++++++++++++++++++-
 1 file changed, 97 insertions(+), 5 deletions(-)
---
base-commit: adff68376f7a6872be00d87720764b30f3ad1059
change-id: 20250123-fp5-display-75cece20d3ef

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


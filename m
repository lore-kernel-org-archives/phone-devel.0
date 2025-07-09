Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D4B28DEE1
	for <phone-devel@vger.kernel.org>; Wed,  9 Jul 2025 11:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752059603; cv=none; b=ot+kn7yBSAfI4wLDagGjzr+Xl5KE7i8l/mEnqD70G6SwUrwdiQs0Aem/vtkjJ+ZpoBx+fhWqww6J12YguNBo7EmbGHX9IsR7ntX1wW4W2IblJtAuKHQnoovby4WvVCoV3FnVbL2hPbs7GB/u2dK2H1xVMnT85uiKeia072SIOrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752059603; c=relaxed/simple;
	bh=KmmXb3IGW58F4EYW7Gl3SaLFXPNaUzU3JQDJ5hBWE8I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OtdtjCON8fLEF+iv5jklOS32Zqo939hQAQ2Zwe2odb2zw+NhFQLyOqZE8I/WwSuY8Dn9MsPWKkStkygXpIwDgARAt0zZruEBVrRp/pylhjXPGqMCjgYjqVSlxxi6gx/4vt6CfSMXiBsKn5Sk2O0C1Gfpf0znyFeFnkdQuHwZ7gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=p4vwdbNm; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="p4vwdbNm"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ae360b6249fso975579466b.1
        for <phone-devel@vger.kernel.org>; Wed, 09 Jul 2025 04:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752059599; x=1752664399; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kGK37SR9qg+mqCt4whATIIAp/+XzlTiBnwS50eY+IBo=;
        b=p4vwdbNmRBhhCsmK06v1IGoZd8oWiALu0lzzJj0FPOe6/XkinSkaTiyfOP7o0d6QSz
         izYggpYwtGT9l3Ox9fXOks35M/QP09liEiwb7xtfP0E+cZcoDXmQwpLhKn4CBG6gbTsX
         NUkfvAKwrmd4rw1yaSt+d9Dks7NbersurvO+rFtPRHgK0UlIQDZAHm+clZ+U+Rc3Av/v
         ZsjYa+hkoAQjpE6Nc6jjL8rv1HslxIP4LNJMxO8bsADjgAlkNGmj4RdyUyChIwdAec/J
         RBJ9loZgvsKk1GQPRA4nfEZMxKrRZKPnRLSc/DqtDfd3wHW1EPyEPp6lDjdzsT6b1IqA
         4SNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752059599; x=1752664399;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kGK37SR9qg+mqCt4whATIIAp/+XzlTiBnwS50eY+IBo=;
        b=eZSH5JoV3LNcZ2BBphIwLhW7gvFbTQQ7VfHtBTkaMOQ/cc5L/XMNS76nWHrkZa4vWX
         OzcteNVL1UmHeA43X/xTzTl+Um21GE7MysWyUErJ6x2uHBCImxBXdk0lcJGpSIbNJ6Qn
         plZVwyoeqbW/KcM19Ve9ut/h51x9ttnOFzzuJFldzYEAM+Xv6WvzQ2X7LtdebIeTybHk
         tcOiGFtZGcqSWV9Zoyw0EYKrkvwVrCw76R9zxpvj0ybLHHV82cFC5OnSYpifaRQ4279Z
         zeqYWhw8JFdYRvOmKoD1vMR6IJECkAfoXJq1dWcszADD0d8q4tKH9hDQxDjDfC3RqHVu
         qFKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGkNmwEXAqEAU4mk8SdxTC/VR8PD5LPs2PxWJdX0Z7oQSHa8qBFFXinKfMaMTJgjmbg81PpGMM+QvI5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzdvgAq3UBKLJzhucKCkbj82jU2JW1ciYPpHxRjvWic7A/fan9
	JjTGh8hOIqdaVlnwL094n/F4O21m9JAxTCWpD3IWAhByaxthXa8g/XGcNOkzGH/xlLg=
X-Gm-Gg: ASbGncuMDrFXwi+8ZXW9UH8yocbegs+USqFhWjmmCs3OWcE+3zBGpApQLmTHefXuSdw
	5w9GfihWjoQ622KrS32P6YxXpJpbTihjzzMGoKdPqfECBZ7GvMpm9L7ScK6koU/qFAq29Zzgm8z
	zAurZSowW4fxuTJZduWTvd25fHxXXXu8SjieOFI31iOLqmJcj+IeQoYGvKDFJivmMRtbg9tipVk
	OnYbG3BXe/iWkUe5tK4nWXfpNfb8te/vXegNk8gFSVnOADiHTU/6kPqfQQszzk4HfI+9VMbIbsO
	SqUKOQhBiBPodd02nKiDxKpqkqG88mEOJ070fsaX9LrYzLu/2aVZWt9fSXmuBuvKbAwhnD1uFyr
	N6cs8rMw9gVGk34nVtA25sSkJCyrOCOpv
X-Google-Smtp-Source: AGHT+IHp9TcPLQmc20T7xVbbGWJIvpTGAkt0LP5/ytEl/Z6MxQQcC47ryedmByXsGf3LPA9gfi8oRQ==
X-Received: by 2002:a17:907:12d0:b0:ae0:d4f2:dffa with SMTP id a640c23a62f3a-ae6cf591593mr163224866b.3.1752059598963;
        Wed, 09 Jul 2025 04:13:18 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6daed7d49sm27191566b.114.2025.07.09.04.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 04:13:18 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v3 0/2] Add support for remoteprocs on Milos SoC
Date: Wed, 09 Jul 2025 13:13:06 +0200
Message-Id: <20250709-sm7635-remoteprocs-v3-0-c943be976180@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMJObmgC/23NTQqDMBCG4atI1k1JovlpV71H6SKaSc1CIxMJL
 eLdG4VCKS7fD+aZhSTAAIlcq4Ug5JBCHEvUp4p0vR2fQIMrTQQTkinBaBq0qiVFGOIME8YuUd5
 cnFUNM01rSDmcEHx47ej9UboPaY743n9kvq1fTh5xmVNGdc2caiXXHODmbcCpjyOcuziQjczil
 9GHjCgM81Zy403rlftn1nX9AABrd+H/AAAA
X-Change-ID: 20250620-sm7635-remoteprocs-149da64084b8
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752059598; l=1151;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=KmmXb3IGW58F4EYW7Gl3SaLFXPNaUzU3JQDJ5hBWE8I=;
 b=BFlJHfIFdwZNkCcQInWTPJFGa8OC9zQO/qCl4TGtDIRqZEYzwxhUdEUp68M0bVd5J0M9KrAmw
 wgEjAlwrq7/DlUOVrPHF0LNqzEMtwYR4oUrLlURJDy6FcrkD+HRcNC+
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the bindings and driver for the ADSP, CDSP, MPSS and WPSS on the
Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v3:
- Rebrand SM7635 to Milos as requested: https://lore.kernel.org/linux-arm-msm/aGMI1Zv6D+K+vWZL@hu-bjorande-lv.qualcomm.com/
- Replace additions to two different bindings by one new binding yaml
- Pick up tags
- Link to v2: https://lore.kernel.org/r/20250627-sm7635-remoteprocs-v2-0-0fa518f8bf6d@fairphone.com

Changes in v2:
- Update default firmware names from .mdt to .mbn
- Link to v1: https://lore.kernel.org/r/20250625-sm7635-remoteprocs-v1-0-730d6b5171ee@fairphone.com

---
Luca Weiss (2):
      dt-bindings: remoteproc: qcom,milos-pas: Document remoteprocs
      remoteproc: qcom: pas: Add Milos remoteproc support

 .../bindings/remoteproc/qcom,milos-pas.yaml        | 201 +++++++++++++++++++++
 drivers/remoteproc/qcom_q6v5_pas.c                 |  24 +++
 2 files changed, 225 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250620-sm7635-remoteprocs-149da64084b8

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


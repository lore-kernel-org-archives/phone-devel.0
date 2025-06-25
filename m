Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01DF2BD023
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 09:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842940; cv=none; b=puSBbVfeQZZuvRjlHq/B6+wj/K33QT2XViPuOku0+/PGlH/q2LKBfZHakT1wCiE0TZontsmZI17vHDQo3vrg7xcdeP65A5kNoNkyPLhLaNvALcjr9RMn3VRQU8KeL9HqpLabam8lGBAjCN++Iui0OJOl/EbLqI9K7EffiBD2/L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842940; c=relaxed/simple;
	bh=aptb8l/VFgrDIa1taJf+qbnb7dxQMxO15lxBXFXp/JQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oCyEhME2A7KVcJyowr4XWnxs0CInsTjpPmGBAqxhPLK14iL8CWpRpXDFvOz7SLC30ptfWYpBlIjMwOLtG0IcuoPz6kve+ul15pjX7LbBUkk0QphmGi963C5fTorLZORMAzCFBLdkt6wDNwN7FBLFKlJ2KIGy78hs+1utlU7OGrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=AxIxFfLh; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="AxIxFfLh"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6070293103cso11561008a12.0
        for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 02:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842934; x=1751447734; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kwIs8jHWHcWsZJaUPIAgXJgATIpQ2CP4tFBNJHO+0qA=;
        b=AxIxFfLhqaBVNcEsMovwdSjZyPBvfK4mC2R29uvsNkBiai3RXq2fXr92V3nhljB2d0
         fxHjzSxj3yyUEI5yoE+NiTRMQOeGuvFDfgkHxCvGz7u/XwMh8f/9MQMvw8yaTS+pgIWJ
         bHlggVjfkYe5U9L1y63d4mVImWOTAFU1QRKX3h7UGWEM92DBUG1Wz9eG1SNX7WsH2+zn
         hxJ++EApVvp4ci7jEaHad0cskF3b0SeOHSZ/7TU+de6j1wyJc7h09GN0iJqkk4ZpASKl
         K+he53uxZxrWs0OSb3AGKgik6N/NeqZOXxEOs/fu6t8+DHmXGlY/B7fLtRBgj09zsxl0
         ZjMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842934; x=1751447734;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kwIs8jHWHcWsZJaUPIAgXJgATIpQ2CP4tFBNJHO+0qA=;
        b=cWePFT7eYh0qDOK7tXh2/EIiXB/mzl3bm4n0Fs+ZFPa1XFzhnKQ0ByFVpr9lkOpBKd
         gaOBqbRUB+ClAZcufb81wP7oTlA5AEvnbqvlblGSBtvYeXwy6W9qxAS9H7J1yaC6CC5j
         oc5FBViLIVoZfMXP25TWcKx01KhZQW34KrcGRSRZNfMmKhYmtyTmU/NqUviGkkGvvDTN
         FETfQbPaqwRL7ND2FiST4q5TNEirlCd7DfUmQcDffaKBU3YK9yHeXqiF46/9A5aIVFC2
         BEGaGCqwb2DICqLG5cRuPmsAjuhcoCGbe7dRypUuknEzVwohbqMfyug9BQhq2yQ+qZzd
         1qbw==
X-Forwarded-Encrypted: i=1; AJvYcCXWrYap+7ks0Jwwvp96Dd7gSxE5FthfEakpq6Mm09PfMIAKC1FLqcIzR0sqNN+NYDcogWNYlquB+0rOhA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPlPmkMlqG+P6xCUMSiIrMv/8uOY+3peunSTN+4bb1VVFWQgBz
	hrl41loXT9eDRhxCdv+qpx1ouS0bJVUGRQMU2m5eCEZ+bg5YC6ITMF+MoGW4Van5joM=
X-Gm-Gg: ASbGnctg0kvudAXOFcmkb2LCXY+2pJjaMC/5oygY5vAUjG5WgjhlMJNgZhc19WkIgLQ
	78lpOu126vrpyi3zDDOac9M04LpP9E1IWBntj9K7k86TnL8K2HK8+Chcs15oMzn8irBMsa95EL0
	rRQ4ZgFftAi13JzxQG3iDn07/Tn3hsUdurxjLJPbo32R8gucLT5gwbcnF4ql0g+gmJqLD3rq8UQ
	sAPaTNLZQElW60L4ePgN9UgolaqJ2lxltN0qbETcEs1sQIFnXu0Aq2gHVue1RawSQa9P74mR3oq
	JC8CesX/+hPT0+oLyFH0ozcV4aGdce5hZDO95pm6droOi44qHVWtpSEBoSIGrpNYz0Vg3t5puvn
	MPujmQNn20cMDPCAMXF7TZrD3U18WUVaA
X-Google-Smtp-Source: AGHT+IGdOTsde/4tV04iLagGS0l3+RiQ3PMit+y3rciCndku3bSKKpPUaXUjkwk7D8PSr50rM3IKfA==
X-Received: by 2002:a17:906:6a26:b0:ade:7bd:e0ec with SMTP id a640c23a62f3a-ae0bea4419fmr221717566b.56.1750842934235;
        Wed, 25 Jun 2025 02:15:34 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0542035ddsm1029713266b.147.2025.06.25.02.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:15:33 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/3] Add support for remoteprocs on SM7635
Date: Wed, 25 Jun 2025 11:15:23 +0200
Message-Id: <20250625-sm7635-remoteprocs-v1-0-730d6b5171ee@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACu+W2gC/x3MSQqAMAxA0auUrC3UWutwFXHhEDULW0lEBPHuF
 pdv8f8Dgkwo0KoHGC8SiiEhzxRM2xBW1DQngzW2NN4aLXvli1Iz7vHEg+MkOnfNPHhnajfWkMK
 DcaH7n3b9+37qBYMiZAAAAA==
X-Change-ID: 20250620-sm7635-remoteprocs-149da64084b8
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842933; l=811;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=aptb8l/VFgrDIa1taJf+qbnb7dxQMxO15lxBXFXp/JQ=;
 b=a9gifMn5WegpIaJv+574eOya7An88NzqdXtU9kaGYzj5mbG3qtUnqUI/wRQkhkdYLwt0qNIFR
 qh7YOyHiIY6CGQXFQOfDeiD5G0/t7SwH2GleWVuywJ6vXhuPdVp5FGY
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the bindings and driver for the ADSP, CDSP, MPSS and WPSS on the
SM7635 SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (3):
      dt-bindings: remoteproc: qcom,sm8350-pas: document SM7635 MPSS & WPSS
      dt-bindings: remoteproc: qcom,sm8550-pas: document SM7635 ADSP & CDSP
      remoteproc: qcom: pas: Add SM7635 remoteproc support

 .../bindings/remoteproc/qcom,sm8350-pas.yaml       | 19 +++++++++++
 .../bindings/remoteproc/qcom,sm8550-pas.yaml       | 37 ++++++++++++++++++++++
 drivers/remoteproc/qcom_q6v5_pas.c                 | 24 ++++++++++++++
 3 files changed, 80 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250620-sm7635-remoteprocs-149da64084b8

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


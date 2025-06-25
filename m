Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D4929A9CD
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 09:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842839; cv=none; b=jC+ZKi9cSg964U0aHc3WWII+xUYwrygFndYgHjL39ZiIhJS2iReux+t5u2l8WAOZzIuGZDNmybKt3YwI21UqJTOCo+UbTmlvi1QmAkk2sqiOEUlcVsisfTGcoktcShubMPiXMuj9NH2hmquywWL70oMGhQHzwSUqKDBeiByOM60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842839; c=relaxed/simple;
	bh=PKLM5z8HYLwWW1nVnJ8iYHU35YL96Qjrdd3whIJP6XA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oJDQ3Vl1qr9BjVCUhc1ozn+RnSA6f8wcRfvjAlbdB45rfNcXCmw/VtuXDjE/QZE6d7hCSo+n+2ZOEEaDy7ccLSePKR1819zIK/KUTIYqjtHdloPKi+Hddx0PgcuzKSBLdTWIKfPVdQzBDxo20NrkD/EUBBY+zOI5BDJ/1ZooSJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=PEAwIMFR; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="PEAwIMFR"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-addcea380eeso1031458566b.0
        for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 02:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842836; x=1751447636; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B1K2B61uVyO/2lRhe5zWoehWYG2JsOIpk6BRaE/2jgA=;
        b=PEAwIMFRguw/FYoVWC7uDAyQCtGDF4QjAXnNP3SjPE5UNdEbBJ6mJiEsGxj6SVYq6+
         dXtZ/D319+jFFkowQx5zZ1tB06PObu11kECZTs8j5t6qG0lzeAYOjXOe1OHcyMhDMPE0
         VsqI3gIM+huqY3s0Y59QtkRU60vrW7DHkMmi14zFuhr91iUU+ED6okFamYip8JjhT0ye
         qU2tdepo6Jy7LQOQnXssEBsni9UHqehmTkxOeqVxOmZN2tKcQLWDqcrC8KMpcviYX3Mu
         t/Sqd6kJ8XpMe/plLQy7Kcx+4C2fudrDmRYXuOCR65vA7Uh//XaJy40zN6NBjnkNNItW
         044Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842836; x=1751447636;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B1K2B61uVyO/2lRhe5zWoehWYG2JsOIpk6BRaE/2jgA=;
        b=jGpqlj+2epPDwKY97Vb9O63alIJnsekNFvN2BQuQH94lPwC6e1u+MyRiIZReWGyFSO
         A6YQ7AUNH5S7v8Bjn9bU4QGcZ2SlyxAGLcUqy/5Lny/F+r9vvkWUPbF3l3nC3DUTl+vM
         442KpfGzEInRusSrjciE8nt++2IFo4eDZ4I+s1PxUco5M99zZIgTr0KJALXjrasKirr+
         9SgXIm9xGUjipshgWE32w8BRsbU45rVNI1A/mmNOouqjG/OTpBAiqixfZq6zHmpUnjK4
         5YheLpziqoLV41/2UZkGOqbgivRI344X9rCzx7WMZQDme0fM+x6eja8puwOvn5Dn+H18
         EiFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQqQ3TFgJ1sdCUEzNrl63yrcmm5hOsr0osGsqGotWe+zMF6dwhYiWqsoxEZ7T7b7xRbyiZtvAABtnxTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgEQbkyfFtj7SFJcYbuCa5bvMSG9oMGSyS8mTUL8aw4NnICz7L
	Jemo7evnAjflNnppgQ3pIiT4TkVY/57oCPpbUQDNKxd5NokX0FtTOhWkwGwBcbzz26k=
X-Gm-Gg: ASbGncv9WuVwNUtvtHO+5RMtD/vtxyFtcd6DzCgbxLthXyeGv3E/h1xCwk7SI8Ehi3z
	7GqQmCVAIEWMMGRJbH/uwxZV2tYL6IEyqfNjqNgpLGza1ChS0IL7MXLVICe39k3zKXMfwCQKyWY
	olEoj+9Y8V397N1NUiE0O3PcLAWEIouphpcRIxellz+m7ZGvDwouX3hDraz3mIoh8Lb/wNcsCZj
	OdShZwWIBRAU932HAYagSge4cnWlES6uyTb345YIYLJi5hY6fa1dDC/S7y/6nK6VkjB+aTJe7Og
	NJiT8bSH1WjTurn50RAWuWSGCqGStsB78lFfv2t5JlthDjGAcX4Nx9CH0tITE+e3Hd75swJLZTW
	r+5yMd0F+8ZmkYifZ0fsxw+DOq8CyNqq0
X-Google-Smtp-Source: AGHT+IEnvvlxg5zImm2CwlaXhVKngXovCQ34eglnTXqsp9GxyjoXHSBIovNct13ikzXkLc8ruauPZA==
X-Received: by 2002:a17:906:cada:b0:ae0:1fdf:ea5c with SMTP id a640c23a62f3a-ae0be9bfb7emr229165066b.38.1750842836377;
        Wed, 25 Jun 2025 02:13:56 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0bf33b108sm106422566b.115.2025.06.25.02.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:13:55 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/2] Add interconnect driver for SM7635
Date: Wed, 25 Jun 2025 11:13:46 +0200
Message-Id: <20250625-sm7635-icc-v1-0-8b49200416b0@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMq9W2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMyMD3eJcczNjU93M5GTdVBNL01SDVDMzQwNLJaCGgqLUtMwKsGHRsbW
 1AD48/rNcAAAA
X-Change-ID: 20250620-sm7635-icc-e495e0e66109
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842835; l=919;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=PKLM5z8HYLwWW1nVnJ8iYHU35YL96Qjrdd3whIJP6XA=;
 b=HbpQ0Bkh1IyDcOAGxoeQ21uGhUCyUGAG8vC/54JVr5dQDP2OIyzDXnLSG3Io6s8DO5yRhyWDk
 Q55InYHP23+ANw2V2XdGq09yqv8mxDao7fNamFOEsJ17aTeHy4vVYv/
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add documentation and driver for the interconnect on the SM7635 SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (2):
      dt-bindings: interconnect: document the RPMh Network-On-Chip Interconnect in Qualcomm SM7635 SoC
      interconnect: qcom: Add SM7635 interconnect provider driver

 .../bindings/interconnect/qcom,sm7635-rpmh.yaml    |  136 ++
 drivers/interconnect/qcom/Kconfig                  |    9 +
 drivers/interconnect/qcom/Makefile                 |    2 +
 drivers/interconnect/qcom/sm7635.c                 | 1554 ++++++++++++++++++++
 drivers/interconnect/qcom/sm7635.h                 |  130 ++
 .../dt-bindings/interconnect/qcom,sm7635-rpmh.h    |  141 ++
 6 files changed, 1972 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250620-sm7635-icc-e495e0e66109

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


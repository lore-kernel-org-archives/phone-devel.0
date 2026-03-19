Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97C672622
	for <phone-devel@vger.kernel.org>; Thu, 19 Mar 2026 15:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773934599; cv=none; b=ntTrt8NlSVUXibmBfUsawDbJl9VPfKbRs0vR4KcttBvKsW4x9vZiTyzj7LuzcFo/3uJtHT0AO+a5NOjSQy9YcByQIKWALu/8zhwSCWTUVutujTyenR49/tH5CecKlG72Yl/kwcVMY1uHyE1X9JAErdaK8eWITE4FM6TNKro/poo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773934599; c=relaxed/simple;
	bh=uAUYh5Zld8KPgz29e5iG1SuJPPPdsG27z4mX5mhXib0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bLAuKTog1h+iHZiMC/mecujtb/4vLmVaNAUets520A/4oyU0hbHvAdkoZIzYTkAyBdSAkatsOQqtfNOrXOoekfLNONVv5mQ763TRbi7bmM0uBjvnyVaJYtU4VbGTZ5qbY+/QmYpjK0NFIT8THwueWOBD1F4fID2GLy7cddRO/ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=I4B+o8++; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="I4B+o8++"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b8f9568e074so156275366b.0
        for <phone-devel@vger.kernel.org>; Thu, 19 Mar 2026 08:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1773934596; x=1774539396; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BFh9idnvGIKmQrvQtE6/tEDjWeUaVvRU4QnDPM5nnUU=;
        b=I4B+o8++WG1QQXfhewiWFMUgPZJiX3WbDuPRAxTdGQO9rf80M1ooIcj7N8uCvr97JT
         okbjZE0EYcJRXyz7AUCoq+4/B93+LTUDmXJG4fzctjN/AXh8uQsd13G41PtaFyxfu5RK
         z5d9yAfSpAOytsObdwyYtZ+sbty0HbYWMR/J0WyWzUmh7gG+BuRKgdEqUxdZnvlzqnV0
         hMW+IgcYaRga1Y25aUH2uGJ2DYwPWG3OAUszY6SO5e/1nTD6gH6iUps1UeC9TREUN3ay
         odj9u8H/XM6xhQc2aWy2vKZDsaOaoi3LpMGwOA6u+61fwlhoKykdsxaKR+GWlD7UgWJx
         JJCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773934596; x=1774539396;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BFh9idnvGIKmQrvQtE6/tEDjWeUaVvRU4QnDPM5nnUU=;
        b=EADH5Nk8tJkyYC1/JoAcFgpRWbApzZT7KiA2hnJVBy7cZSydzpkqYivlne9XsvNZ4D
         u17kdSLh7RlRZiXzRYO20vKv481Qbx9q1Q+NjG2RdA7hhDUMHD6jWo50mQBsZz+CIB+d
         rPNUsxhvJ5jmMfIbNmrmcK/BbfpY2nwmAdbxZBEwb4dLDJUBmkI/x+0wKh7ZACYOmEi9
         w9OxZPoVPb9FSqiP4L9THFtnNLAOyeJPSTnyDW48CCAUq+XGw5Eohk5nsZE+uvXNj0QB
         g7buKQ7xGZB4KVw2x3+Ub7hYFJBEJ1GYkz4U+38t5CXMoYd9iIkXVv4wIk8S/3qsfuEm
         AH6A==
X-Forwarded-Encrypted: i=1; AJvYcCUO3cxtSyWvawgVApjdNsIPH/4Cisnp6Ry2ADrGVgEw7t9ra6En61zDAddSLfaMT3+NFEQwXS+nPA/J4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyG1qC6lHKS05h+VEDwPqD3/2VE27X+5mvhgNHze+IJ5vbx/rTU
	CQK+STfCxttQtPgQ6I2cK3CDIWgZj22F/K4Qpgo3BSdwcl65n+/Z/qQrXOU5JFtIoWI=
X-Gm-Gg: ATEYQzyT9wVEe8cp529KMDBaYLlucB09wFtrt3RDv1BKGO/i5ZEtlyFGVD9LhEIxgJB
	OCmItYX7kQjrOqOLg3ypIfE+DpM91DC4jP1QcKxE3B7bEMCwLBH0grtGdHPafBcyYOjkYDFmSLy
	ZgwyorxmnVELganDNqzHqSfyq7OJ8FL5A2IvTV+ZAt9akCYCEEIpN54s1SMpM3DE7xFGV5TROIu
	MOLX9XZaTHjFda2tZ4Og75qN9VuitySpqBlvUaoAfUftt2SAVi1A4iuAKnsh5vGS9fqLcA90eS/
	3NaWGOtry4bzTsB6xyToCj+z2XnNbYclkRzvrEOa0FcPY6jiomavaohmXubiy/wG8zxLo6OGU4h
	fkLsg20Yg3iL8HPduWom0ZzuQT1filgtM9vuGIqRZnu3m14E4QuNQYtytU8ZCduvyoyqNPqNvgL
	7pXe7LukVA84I3fGDRV4wC8w4J4EwU36mAAhCy+2ofFbzpyy2LQny8L3HfNVBa9cSeTx5D5aLdI
	zKJjA==
X-Received: by 2002:a17:907:da16:b0:b90:4b42:a982 with SMTP id a640c23a62f3a-b97f49d8f36mr523464266b.41.1773934596177;
        Thu, 19 Mar 2026 08:36:36 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f173a3ccsm457568366b.59.2026.03.19.08.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 08:36:35 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v3 0/2] Front camera enablement on Fairphone 5
Date: Thu, 19 Mar 2026 16:36:27 +0100
Message-Id: <20260319-fp5-s5kjn1-v3-0-9cf4b8c09567@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Nyw7CIBQFf6VhLYZXKbryP4wLQi8WjVChEk3Tf
 5fWhY+4nJPMnBEliA4S2lYjipBdcsEX4KsKmU77I2DXFkaMMEk45dj2NU71+eQpVkQrKTUAkxQ
 VoY9g3X2J7Q8vjnC9lebwHjuXhhAfy2Gm8/q3nSkm2GphqWlYw6naWe1i3wUPaxMuaE5l9qlvv
 nRWdKkEafVGmLoRv/o0TU9KutSJ/AAAAA==
X-Change-ID: 20260313-fp5-s5kjn1-80a866aee261
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773934595; l=1161;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=uAUYh5Zld8KPgz29e5iG1SuJPPPdsG27z4mX5mhXib0=;
 b=yrLm0tOH2JQg9X98E+PvcMiPIwh8ekEX9M+YCBUg12RV3F6OI6U8khr48Qn9Qs1eRXWnc+/dK
 bYDx4ta2mWcBV4sK5Ip1yjbB9sBH5YJLt45RFOYu5Fr0SSb1cQB+my3
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Since the Samsung S5KJN1 driver was upstreamed recently, we can enable
the camera upstream by adding a few bits to dts.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v3:
- Drop clock-lanes property (Vladimir)
- Sort s5kjn1 supplies alphabetically (Vladimir)
- Add newline between reset-gpios and pinctrl-0
- Link to v2: https://lore.kernel.org/r/20260319-fp5-s5kjn1-v2-0-6840da94c574@fairphone.com

Changes in v2:
- Move cam-mclk3-default-state to kodiak.dtsi
- Pick up tags, drop applied patch
- Link to v1: https://lore.kernel.org/r/20260313-fp5-s5kjn1-v1-0-fa4f1c727318@fairphone.com

---
Luca Weiss (2):
      arm64: dts: qcom: qcm6490-fairphone-fp5: Sort pinctrl nodes by pins
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add front camera support

 arch/arm64/boot/dts/qcom/kodiak.dtsi               |   7 ++
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 121 ++++++++++++++-------
 2 files changed, 90 insertions(+), 38 deletions(-)
---
base-commit: a282db4e6cca214bf1be92ea3060f31123172cce
change-id: 20260313-fp5-s5kjn1-80a866aee261

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


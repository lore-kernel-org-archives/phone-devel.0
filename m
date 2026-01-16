Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4051972612
	for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 13:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768569448; cv=none; b=pRFAk8M8XVoafNvxAGOwJJZloVZ6huR9rqqOf0gN8nl3ZkKC6rqdsurFzT09nr6kJa/8Z8JFcck5ramuaIl5H+qCEYVYxdhvofZ1qKttXhiqXHx0jVBVUmrTMpzFj1qOi84CHzEkQo5gZ8T0sekm6fwFSrvpwKTakuiVeORT8bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768569448; c=relaxed/simple;
	bh=0IcwqQH5YyvspgnfvtfN3G6ejhtG8SMMlKk+P1Z9ZNY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tRAJv+JTeEKSS7UasrYfJBUJzSg9YtLGGKt3C3dOW+kU1jaeAsDlcOUouCNPbMVvlI49ozHy3eJCWBgJoOS1i94wBotCb06QWqCUaXdqda0QL1jt21F8kbwk+y+P+nz1y9xI76epPgaIBjM5In0GnvMx57Lvm91Dpn8nhrQ5HJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=bXxtbdvj; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="bXxtbdvj"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-64b9cb94ff5so3020018a12.2
        for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 05:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1768569444; x=1769174244; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LeO3PxpMi+3RzgWBsyhtH2vzdSGJNBJ2My5HKc/4nPs=;
        b=bXxtbdvjNWxN8CPYrzUOVoTVIk8UCAj4YMnI73pV+i3SUZNY0BkEBaOvxKjvOisM19
         z4GLiV/jFAmjXHmKVkjtZbkhRx5XPaZE7OsgLwvsK3/7/Zt3AV5KGfQUb/jS+uXX/sl6
         +TdgE8dOKuZC/0zxlgqXHl2pFOID1kEFo897MHioVKQAKETgAJm5aV6rpiiZzmy1SyIy
         SQ3KMho/ferVejQqTJx3uo8ft+IUfmYP+pe8XQdjsgezHrNPIyv8298abTsBr0mH5VzJ
         kfhr3gsp+Wu3qS7WMaoHa6kHNc8N5IynhFA6dP5n+GRjNjkQHP999M0FBfH1TspCeHJ1
         wyPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768569444; x=1769174244;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LeO3PxpMi+3RzgWBsyhtH2vzdSGJNBJ2My5HKc/4nPs=;
        b=u/DCr0qHzTC60+T7P7t8UZQKOceLk8JiZdraM1YqIM62AIu3EdcgJb2l4klJ3AaWok
         npq5BQugPwrP0DBc9DcWP3cI7tZmfhArLDYqZNpqVzPJ/I3sabLraAf59BeYn1eBeEfM
         fqwuDYHzjxn93hrnv+5ShoKeBs1cHrjgUvwCT9itRAr8Dg4MifWUYO8IA9K3XD9etdj2
         QBgSfw5P2aaDn3DcFxjwIj0ujpNSewPIVBeDJhOhwmZvXE39lOWMtg/YxsEEd32DVszk
         h5ow9sl5Et4LUxRULQ5tgDq4kcn9ZHXsfC+pZdeZqpQhSyQ8d/Tq9kRqwpZhZNhxVJsf
         lB5A==
X-Forwarded-Encrypted: i=1; AJvYcCVMfZAMiGaSDndnLGNg4Lj0gVgddeWTPZi1muOumX5ZOg1aOAJnmn3CnffdBSGy6ZhiboQbYnaf+GhqnA==@vger.kernel.org
X-Gm-Message-State: AOJu0YweontepXYaVRYBt4TS41vrIy4/3Wz879hvRgr1CCbE4jZ2jR6K
	YtRL46SJETD7iCA0DKD/LTeTFT3DVEl483oa2YwvzywpOiFxIJtCPhRCTQ+GNRTp5jxtrN2jzwm
	TXvnB
X-Gm-Gg: AY/fxX5TM+i9LnkPgOnyeDPI51xh/uw34U9tBYmGCoZaf4AumcQvQMSTxjvIpWNmmU6
	wBHvmmQi7Zfpjl/KUl723LVkaNiKGPNvtWPvdEdtbEsXhhfoH1hDfTn4viX0dWSDT+5bkTT9yt2
	hnB0uaizkaA9d+7yrgiYUnNCW6SzwXzBRxWcNndZ/kUpMKwaupMuNE5C8/1e3v82Gh79oy+gs9c
	gJjkqic6RkMQDrn2z4e6lqP9S/jCsr/sS/rk/Z7lXY/MPiPZLDmBRhziSaxultPtyJooADJAKlP
	YDlrzwLqpjpmrJor9SVNCZT9XcU5baEAhPy4XuqjRkZJDLcrC6wEI7pG0MCQ+PuyY+DAV+y7kku
	eet6W7N+u5ZeL6c/aq/wKItKvEdKBusxO8nZQ9BQhOG3mnhOA6VUfL1rzqUCM+XlZY0KdF+Tzg7
	zQ86KWpKrmduweEbfFHKeC5/LJh6c2m/0zS663TkO+FBmozGN/zmFj7Ez/7hqNKcuM
X-Received: by 2002:a17:907:7201:b0:b87:281b:1453 with SMTP id a640c23a62f3a-b879324d5bbmr279364666b.59.1768569444136;
        Fri, 16 Jan 2026 05:17:24 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795a350dbsm235507366b.69.2026.01.16.05.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 05:17:23 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/5] Support enabling interconnect path for GDSC for fixing
 Milos camcc
Date: Fri, 16 Jan 2026 14:17:19 +0100
Message-Id: <20260116-milos-camcc-icc-v1-0-400b7fcd156a@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MuwqAMAwAf0UyGzAqRfwVcdA20YAvGhCh+O8Wh
 xtuuEtgHJUN+iJB5FtNzyMLlQX4dToWRg3Zoa5qVxE53HU7Df20e4+aCS3NQaQhlg5ydUUWff7
 jML7vB5s+w8FhAAAA
X-Change-ID: 20260116-milos-camcc-icc-d41bdff31ef8
To: Georgi Djakov <djakov@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768569443; l=1538;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=0IcwqQH5YyvspgnfvtfN3G6ejhtG8SMMlKk+P1Z9ZNY=;
 b=BF0Kn3KVXUmmI5VyWZ3MMLd9Dx/ED72uHOpJt+C3M/p0HmU+c2cc0GJqaqF2EZhm29Kh8nBAS
 h+npu+bFF5wAFmKECrIX1NdAbRXBeh55KJ0NEtbwkro+ohqY4bJsVIm
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Some power domains like CAMSS_TOP_GDSC requires the enablement of the
multimedia NoC on newer SoCs like Milos.

Add support for getting an interconnect path as specified in the SoC
clock driver, and enabling/disabling that interconnect path when the
GDSC is being enabled/disabled.

Then specify that dependency in the camcc-milos driver and add it to the
dt-bindings and milos.dtsi.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (5):
      interconnect: Add devm_of_icc_get_by_index() as exported API for users
      dt-bindings: clock: qcom,milos-camcc: Document interconnect path
      clk: qcom: gdsc: Support enabling interconnect path for power domain
      clk: qcom: camcc-milos: Declare icc path dependency for CAMSS_TOP_GDSC
      arm64: dts: qcom: milos: Add interconnects to camcc

 .../devicetree/bindings/clock/qcom,milos-camcc.yaml  |  8 ++++++++
 arch/arm64/boot/dts/qcom/milos.dtsi                  |  3 +++
 drivers/clk/qcom/camcc-milos.c                       |  7 +++++++
 drivers/clk/qcom/gdsc.c                              | 19 +++++++++++++++++++
 drivers/clk/qcom/gdsc.h                              |  5 +++++
 drivers/interconnect/core.c                          | 20 ++++++++++++++++++++
 include/linux/interconnect.h                         |  6 ++++++
 7 files changed, 68 insertions(+)
---
base-commit: 48746fac3857845ce7ed4aeb56df58735208ffda
change-id: 20260116-milos-camcc-icc-d41bdff31ef8

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


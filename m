Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137D938888F;
	Sun,  7 Jun 2026 14:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780841545; cv=none; b=cDMhp1nXaIyXYzaeWpiqPRXjjN/AxqX6RRFaRfqqdBBNHyiR5mt50MGdmDnVE1OknLGMWgMzmZ6hQCJkZe4twts7rp9HhnKvOqJFOepCLgQdyYrAyuzuFcvPI4GbJi9cHY1YkjaNsgDQXrNnjKbbdlHXbADbCGZlHluj5erW3Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780841545; c=relaxed/simple;
	bh=VXFI2Thg0ZPZn98L4AfzCgC22eFLe52VScYx6+NF/yU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TM8fOp2wd+R7ttN3uDR7EpW0IEXgP5L6VFU7lre7K0BCHwS4PMSh37krevYKb1nF8Lgk8DukEZjodRMrVWi9BGstQbC57z3AGQd6b+pTWIM+Wn7u3doyzikooUXfSGFZwQz7ypm06TlcvDQjQhW094pcrOv2T4QBVlBhEYEXA6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SAvPzBJ1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SAvPzBJ1"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A654CC2BCB4;
	Sun,  7 Jun 2026 14:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780841544;
	bh=VXFI2Thg0ZPZn98L4AfzCgC22eFLe52VScYx6+NF/yU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=SAvPzBJ1YQuIsk3JhvlUZbaPXxIwX0alXTrTaWy6YcsuuUcwCkxgcvdC+cJTUgoIM
	 nvGyNLcS9cRhyIpTjh6u7U5qBD0bPpiBVv9c7+otsPLbDuiBrmAVlUpxLQuux7OG/+
	 9LEC/1T9Vd/rOiuhe1oglisdWfZD+0Pp0iTGqFu+EZIWOTnHoOYsC/spK+OwUFdoFw
	 boMcbxyRLKTDVrlB6cHE9JeMER1CMiDffcrtGbpZWRGbvG1ChbwJ/GWR55tIG0Kz20
	 T4HJWeHR6b5YCJiQmDzh7Q+FwhZLK5ZkEElkWqHo2qmZHQ6u5aav8+NYoNyj6rMebS
	 nGXeTFJ6a8azg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A559CD8C8E;
	Sun,  7 Jun 2026 14:12:24 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH 0/2] Convert qcm6490 framebuffers to use memory-region
Date: Sun, 07 Jun 2026 16:12:17 +0200
Message-Id: <20260607-shift8-fb-v1-0-72b9dac25f4a@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEF8JWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDMwNz3eKMzLQSC920JF0zg7QUM7MkA/MUCzMloPqCotS0zAqwWdGxtbU
 ABywqtlsAAAA=
X-Change-ID: 20260607-shift8-fb-60fd66b07d86
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=635; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=VXFI2Thg0ZPZn98L4AfzCgC22eFLe52VScYx6+NF/yU=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqJXxHGDqvCtvP8Vvnx1zOU2LExgk5yOf4Ltu8I
 KlzHGelSKyJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaiV8RwAKCRBgAj/E00kg
 cjerEAC7ml4ybpC2agnoPSETQiKU7QNKBAJWZEib4uznq4lSZy7DKIwhk4udcgBbI7+RGeLMh4S
 VuTv3wZpRGCbuIIieuZlCrcVrKX1757jsrUOTaoLd180aCWc1ZIDQAGP7Vl2Z/w2Yv3G3XdPgW0
 E9X4mo7pu339AhNKSZuC/7Evzi5FR6ykFd5F889dpiuOM5mn4dfOk4yb+B6B26opvsh8YBIrDjC
 cJ1Wx48il8O4i6GqltQAa7joEMW7d+UVbNnC013ln12dToERGiX4w/v61oOCf1aCHBWCElzkHLq
 pdv7YW49jWMAXzrb4xIEcmqk91yr4OmelxnlyP5/Tr8xskcxM5NZfRPiXnhkz8GiDmdaTwrNm1g
 uC4TKhhRZz+gulJc9XoQ/g+sPH8LgdNmlQjZF1957T/oTWa9PnSDp0RlKmgYi5hgWJQnehlT1Xb
 iRWTzwg2ht/7S1Arh9I2Ca4eLSXGzz7UxBw7X+5oAmr5hr/N3Sph/S7KWfFIvq2HqDj3icg87Ew
 84EelkKhnKU/h9RfYRsWQuFyY7XTF/oGERY3STRrz+XKQiuftUhMF/k9qpmOxCmaONxzy6RefdV
 LhnEXvtU9UHTglrH9bG9v4OB2ihibwwZFjcVWiDjNkw0FtJDuyWRkC3j1/182y+rIQ8dpInpTJj
 wCtRwoDKT5LM9ew==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

Now that upstream u-boot recognize it, no reason to not do.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
David Heidelberg (2):
      arm64: dts: qcom: qcm6490-shift-otter: Convert fb to use memory-region
      arm64: dts: qcom: qcm6490-fairphone-fp5: Convert fb to use memory-region

 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 4 ++--
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
---
base-commit: b99ae45861eccff1e1d8c7b05a13650be805d437
change-id: 20260607-shift8-fb-60fd66b07d86

Best regards,
-- 
David Heidelberg <david@ixit.cz>



Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DEC222565;
	Sun,  9 Aug 2026 16:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786294140; cv=none; b=XtIp+4Fr7xkZXYSt6q0UHLdjcnRpg1Ep5nAyg5hqYvk83QxdauzZk4mVkD0OElwzRthThg1xwLZJ/HdnQ+cf+CSpObXzvEN6lyXkWxDy2bxK66Z5wGep82WlKt2AZEFskMP1a/GXoTGMNInBaXn1R56oIuhHJ3wgpgfKaVtTF+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786294140; c=relaxed/simple;
	bh=IqBfubMqX9igKzB3Yyfy5WxzraIPUwUgP7EHhquo92M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ltHFsiMFRdbS3tKXThUpRmB1PtpWygEy1VqtVWUOD9Cj0cYGATDCyQDjcl/SI6zEPrRgZSgmdLlI5C6E8DV5H1Qqs3zlYlQ8q74d50EQJ7HEkJny2Kcb2cSwfC2Wmno7jDwbiYJK5XprImA637JT8GRmyzL/RAIYOpa0oXTPdhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NhpGHySC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NhpGHySC"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7ECC6C2BCB9;
	Sun,  9 Aug 2026 16:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786294139;
	bh=IqBfubMqX9igKzB3Yyfy5WxzraIPUwUgP7EHhquo92M=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=NhpGHySCD57Lh4JIIK25DHCU2Jh0wFy6Ws+B+zmRhszZmyab/AoQSWAvidT7twles
	 MU0iDKTOoNv2gj81AmdQOD/R7aI7GogurZfSVLHb4DO05b2iYCldEDtNI2AszFkoAd
	 M1Sxx9r+09REJ4rAK6/EhrFrDduuKm9la8E0+M4jR1uhjijHXx5IcuQLPI3zxdHKe9
	 T6QDKTl3qYjXmnlBbBSx7z6jxj79zrBMZEd7tUEIWi2i/L9hnnv7VO6HoI87WsULW/
	 laSNAwinonAvXwi5fWt9jodPhEI3ldNv85nPgPqHF7kcJHOECD4dF4pCjCd8f/IA4O
	 STlevX2qrZzmQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B2F5C5AD7B;
	Sun,  9 Aug 2026 16:48:59 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH 0/2] Introduce support for Xiaomi Mi 8
Date: Sun, 09 Aug 2026 18:48:53 +0200
Message-Id: <20260809-dipper-v1-0-eb4d501e85df@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcyMD3ZTMgoLUIl2LtBTjNMNUE3PTpGQloOKCotS0zAqwQdGxtbUAUi7
 ux1gAAAA=
X-Change-ID: 20260720-dipper-8fd3f1e475bc
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1201; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=IqBfubMqX9igKzB3Yyfy5WxzraIPUwUgP7EHhquo92M=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqeK957nUnHJDfqfqIsmG3wBE+pXUx+Siukh4au
 YQ77eDeBhyJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaniveQAKCRBgAj/E00kg
 cvqBD/9X9FsVRr8gq9xQXnyBSBTsKXp+iAtKnoDXBaaqF1nPgveeBpFrAuFVEtE41COE+QY7myT
 sPvnSL5cU0+WnZ/oGqOJiTMa5x1WhD7JKI9K6sM29C5XJNiU7HLfeu7A4eyPSOteHuIg1F3VpAl
 NitGVw0Umv+u8VFazdbijG5mXXHsgCaDMIoYdRVvuVmDHoxi4tmJ69lP7HT39BKLGlz/6/EgINB
 P5w6nSubGjIuX93xcDWL3qDzB24PGaoH5DAyU38J1hOoBADhdXmx+nFUTqYGi5tGFlv9imYrNSe
 ou/7wEseXSe+VIm0ydwS1Lox90DdVL1pF7EocK12Nkch1CgZFr5hbc4OCwzYeYRTxqWBZKadmWi
 b12eR0SM8V23ER5PBO+BQkU21MeYYR1HN0APmrERixDTDKlqA66BqK25Q4HUSO/1GUEAG1Mos2G
 iTTMAXYuRTWDX4dhAKdz7vxzIvTesJ1yRw3OpZu7pFea3vZTbET3YFl4IsUEtUI5qoPf60Kk+fG
 Qw7fqdm5avvTler2zCj2sI+7ImJzJ0N9UP9gyWJ7Y0wVXdhmR69nxyq3WqZYa5eNap8ODr6Mi+8
 LVH59/bHWqjY2AWi+Wv4SDh5yHf+30Ypt7NQs6tzHWIZumCOOTkDTX+LGclP1SNRp/4eE3Hdr+N
 c4Rkgg761z85d8A==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

Currently only Mi 8 itself is supported, but the
sdm845-xiaomi-dipper-common should ensure, that other family members
such as Mi 8 Pro, Mi 8 Explorer will be likely supported too without
much of additional work. These variants should differ only in the small
details (such as battery size, fingerprint sensor etc.).

Minimal viable support for xiaomi-dipper. Enough to get basic u-boot and
Linux functional. More improvements will follow.

The display and touchscreen support are work-in-progress, but waiting
for other bits to land.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
David Heidelberg (2):
      dt-bindings: arm: qcom: Add Xiaomi Mi 8 family compatibles
      arm64: dts: qcom: add Xiaomi Mi 8 (dipper)

 Documentation/devicetree/bindings/arm/qcom.yaml    |  10 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../boot/dts/qcom/sdm845-xiaomi-dipper-common.dtsi | 623 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-dipper.dts  |  30 +
 4 files changed, 664 insertions(+)
---
base-commit: 95d6a9ccef99117115e41e9adb271243bd5e985b
change-id: 20260720-dipper-8fd3f1e475bc

Best regards,
--  
David Heidelberg <david@ixit.cz>



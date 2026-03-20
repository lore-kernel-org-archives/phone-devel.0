Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18833CFF56;
	Fri, 20 Mar 2026 16:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774024147; cv=none; b=oOdkh6xO0edJHLadATtSaHPf5d2yzVzjW+O1EebY0a+IkboNeccbisSRM1oXsawDzGgIwyC+2LxAyaaQfBrHNS+KWrVrhkbP2OZt9JyU0FrmWRo2YxJ6WRtDUS+mO97nJ0KWMdraafRf8NFZ0wEoms3Fer58g86sg8dK79WNS40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774024147; c=relaxed/simple;
	bh=Ug1ZlH1itHQlZdElqdeD1isP56arF+w6CXvCerFsyC8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LFRhFYt9vv6Bj+TAPFOcuoEkRg5wv3C04TpbgrYkvqf0ONj55bkdj1ijAYDvqzTnRVygruiDbRi/87lyL4VIZO0G+/V7IQqO8P2Rikv8EQWJ92baYSGPgp94S2yzDclCvevKsNv/496YqAYLomZLciRq4Ypw1IPiBRQAAvhLu0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vpqz1yrO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vpqz1yrO"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6620CC19425;
	Fri, 20 Mar 2026 16:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774024147;
	bh=Ug1ZlH1itHQlZdElqdeD1isP56arF+w6CXvCerFsyC8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Vpqz1yrOZnMcMSKzkAYL7BSJ7ZTEKmofGGXW96HX22KmctM5V8GVHzQc9NgrrOOB7
	 W5JBMf/uaNE8eIFMakjdcr6F0j+3cHJzsVCZsjEuZihTQd4+ngiJTrba9KG9/YoceB
	 YCRCjBpP0oZV+u3Av1JWQttmoOj47jHZtfuYa4+Z21d9fJpGTeSJBCtYoY8eL/TjjV
	 zJaxek7xGunOzGP2+hcxJ9zKrgqxpeiM2PIvBvIHaAeXucFJtu3iVl0BY6oYpQoPfD
	 kOLu64Jel4Ov1HWMyo7dOHxN7kEBLvKTzYgs6O5Ea5IfuU45cnezAWgROprpwIyaK7
	 Y91uL+RW4DzMg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C23F10987A6;
	Fri, 20 Mar 2026 16:29:07 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH 0/3] SHIFT 6MQ SD-card support, improved responsivness of
 touchscreen, and codec
Date: Fri, 20 Mar 2026 17:29:04 +0100
Message-Id: <20260320-axolotl-misc-p1-v1-0-89c9b5ecb26e@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANB1vWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYyMD3cSK/Jz8khzd3MziZN0CQ10zA8MUEwuDZCPTlDQloK6CotS0zAq
 widGxtbUA1dZ+emEAAAA=
X-Change-ID: 20260320-axolotl-misc-p1-601d480c25df
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dylan Van Assche <me@dylanvanassche.be>
Cc: linux-arm-msm@vger.kernel.org, Petr Hodina <phodina@protonmail.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Alexander Martinz <amartinz@shiftphones.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=752; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=Ug1ZlH1itHQlZdElqdeD1isP56arF+w6CXvCerFsyC8=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpvXXRcxjb8S5LRW8Pns7ES1MQJV59xBIt3G5V3
 POW24oXwmqJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCab110QAKCRBgAj/E00kg
 cuItEADFkkuZYtDhkdxfwf8AQjLxixHSPDF3FM9seYuJhTVHXMluvFfmDf4X6oWjpYhPv6GYrkq
 VhltG5hH+UNFpER1sE4gjnsiOJYepgWeh1HgswxMskYdOJQSlgicrnKhUjrCcfqMvuy3tnxWQmt
 cWcb1vHq5TJLnfNyPkLYjSW9UHt23uC2VpEB+Zw2eMN2zq8/NtJJWjpy2Ehc7XoLTKL+6LU8w/p
 69uHcBZPpjn+XmHTfssVC7a27p1UgrwCsB++JBkE2WusuWdIg3BtPPg3uDcOVrbV7iMMoIBuFdh
 y21wzDVmYCwZsfZ7osQKHGTpLvgXCbFqpffxhBeQqxNHQI5UxkWQu40wUiVVAgFMiuuPLDf1H/K
 3lWHVNmc8uTILEXvLkv12GXqUnrQnQYI3YIFcZ7jm3zU2PLoBxr2M8ZGWKkc/DmtG0trKEtqqyj
 rmqvBCuSkG7ej9C/DCLZ4fiswBO9r/37udralxgat0XSRjso9ugGMD3pgePaTBvVlgnIetH0YEd
 yRO3KrnAJpcYDgwiTMLL+2N+hNPGBAjY8c0kJ89xXXJ5zrD6w/zBjAdraUxVkWszgo17ylp0OkN
 GNWOUXmEkNeS4hhnu7lRmtsEDu+19DW3Qt0xlfctSYEARyWeVxtqQU0E5OcZ+0Dbj5vRDYI0I7O
 WX8dqDAq30gaVVw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

I've tested that SD card and touchscreen works well, the codec does too,
but for complete enablement needs soundcard support which isn't fully
finished.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
Alexander Martinz (1):
      arm64: dts: qcom: sdm845-shift-axolotl: Enable TFA9890 codec

Casey Connolly (2):
      arm64: dts: qcom: sdm845-shift-axolotl: Enable sdcard
      arm64: dts: qcom: sdm845-shift-axolotl: Set higher touchscreen i2c clock

 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 58 +++++++++++++++++++++++
 1 file changed, 58 insertions(+)
---
base-commit: 785f0eb2f85decbe7c1ef9ae922931f0194ffc2e
change-id: 20260320-axolotl-misc-p1-601d480c25df

Best regards,
-- 
David Heidelberg <david@ixit.cz>



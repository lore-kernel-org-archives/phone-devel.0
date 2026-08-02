Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944A93911CE;
	Sun,  2 Aug 2026 12:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785674567; cv=none; b=Ji6ke6jqMM5+3smXgKD8GhM04e2Nshcuo4nLshqY+/dEFGEFaUbaK7RTuL8R7BllTHjKGoBLKF5VfBcyj/lQltMzRoJqx/PC6kLExUJAnu4QqGseZzcbJ2T8ISEq5Q/fEekRhf4ApOtlWLKQ/aqK7N7ap6veuZqaQm951nsAxbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785674567; c=relaxed/simple;
	bh=LHd8IQtiCglZomN+UtHu/lSZZpaQjVgW1xEwT9BNfWk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lAWH2p7Una2F1U3/CLUHjTK5jODe8XoxqvwupM2dj/P5robOaoC4DeeTESzdesHOQeaKAeYZxbRwP4KGL8pnnUtXwdmLwX7o4sg3pUobCuYzGgMl5tf89zXXrWaJhweCYnUhJA2j2/X2Ea4N4jAcYxJNA/4AhJ4MGMq1ygDJhGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GAncVHJX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GAncVHJX"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 12AD9C19425;
	Sun,  2 Aug 2026 12:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785674567;
	bh=LHd8IQtiCglZomN+UtHu/lSZZpaQjVgW1xEwT9BNfWk=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=GAncVHJXmnuYjQ5BdwINvsKtpXtdPqKlYlGT14EHMmbYmWbI0CbPXBLOYEH1C2iD/
	 34YSHML+EYra7LYE634p5u9lZYFLCgU3lXjEJ4p1PeoGnNJjmQZQejUi6Fu3eIdIXi
	 f8Ukg9df6AJYQ1DC4FDZ8CkU6x/jfRNx9jzBm6mJpDwQFX4dOqfgVTaD9zx06ujxJz
	 80xi+I4FwkoME9VgMY3rOfFb2YjHzH/t72WL9LDdunHIGmqcAKhgNAps4I9c+vMgPm
	 Faw0ovgGP8cb4FI/TxH0s4qGsxNgv6rLS6Hkgzo/Gqny5D06iUta0p4CO6ZuTNLgIS
	 krJX1eCmZvK9A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD352C55175;
	Sun,  2 Aug 2026 12:42:46 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH RFC 0/3] Initial TFA2 family driver for tfa98xx
Date: Sun, 02 Aug 2026 14:42:39 +0200
Message-Id: <20260802-tfa98xx-upstream-v1-0-4dd55cdd658a@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCwMj3ZK0REuLigrd0oLikqLUxFzdtEQLy+RUc/Mk87QkJaC2gqLUtMw
 KsJHRSkFuzkqxEMHi0qSs1OQSkGFKtbUAEn59dnkAAAA=
X-Change-ID: 20260802-tfa98xx-upstream-fa89ce77b7fb
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1676; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=LHd8IQtiCglZomN+UtHu/lSZZpaQjVgW1xEwT9BNfWk=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqbztEiZnS/iGr8vwcCTN7CWCBBcZcmD7+5eZR7
 Yet0CTQCqWJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCam87RAAKCRBgAj/E00kg
 crFoD/43ZKjDyEsSBo7mc7a1yNkmdve6aqH1j4TkTcw5/MjdCAcsQyQOfMULb0K8+YtMFUFExCD
 RpDSUYzLrT8cZQmWBGWAwVL52s2YATl9nCvZCw+5+cBOSHcWNvDhoiimHaF79JaRJwsaX2GQmmt
 RPoLSZ+0466S7IMKC7BgNABxBbs6eX9HQ79gHTXTIubean9D/1YKnvtTEwNYd24OVJxbCCoIF/w
 Ts5W9IISU5YVcDF2xAF7l5m7Vze2W18Ue2vuMMwkc5V4FYQsghu/wD0rQ2FHfJEKLFtdKmUt0hS
 d7UTx0TKebC7iM6t6IquKVPgT/UAEqaQ8fIZ7G2HlMXhx2w/oxucWFEN1r12UxQPnswuuS2EtmS
 g5TjjqlLivGTYA/4CFOx733JIWkh0Izl3/kkfZMmeiKt5GSGG7ZXtKg8AjUP7550nxTUR9G6FgO
 XVizOuzif2V1VRYSSXHyemveLlc+XDly2/qRW91o3cpcE4ovj32sdusqmX1k75qwG/nTkmSKJZB
 TfO8dfw9gmyBKhB7LjitIDzz9V8WLWYBKny3aOMAvCnTvbXcwtf/N6fycnfGOmRjyvYUs/dywmh
 qF0LOoLWJSeh2mhdzRc19rDTaqdaxviC1Nxk0Zzy9uy+2+QuawA5hz32hLe1OVls/LmzMy42XRD
 QdS+9x3XauPPalQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

Introduce basic speaker support for the OnePlus 6T, using the tfa98xx
driver.

I've tested this driver only with speaker on OnePlus 6T. Please be
careful with volume levels, as the speaker protection are available only
with CoolFlux DSP enabled.

The downstream driver requires the firmware to bring up CoolFlux DSP,
but this driver completly avoids the DSP and thus operates without the
firmware.

This driver is different enough to not share the TFA1 codebase (tfa989x).

In the future, should be possible to extend this driver with other
tfa98xx TFA2 family based chips.

This RFC version mainly exist for early adopters (e.g. other phones
using tfa98xx amplifiers).

You can find the code at:
  https://codeberg.org/sdm845/linux/commits/branch/b4/tfa98xx-upstream

Signed-off-by: David Heidelberg <david@ixit.cz>
---
David Heidelberg (3):
      dt-bindings: sound: Add NXP TFA98XX TFA2 amplifier binding
      ASoC: codecs: tfa98xx: add driver for TFA2 amplifiers
      arm64: dts: qcom: sdm845-oneplus-fajita: Enable speaker codec

 .../devicetree/bindings/sound/nxp,tfa98xx.yaml     |  54 +++
 MAINTAINERS                                        |   7 +
 arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts |  22 +-
 sound/soc/codecs/Kconfig                           |  11 +
 sound/soc/codecs/Makefile                          |   2 +
 sound/soc/codecs/tfa98xx.c                         | 421 +++++++++++++++++++++
 6 files changed, 510 insertions(+), 7 deletions(-)
---
base-commit: 95d6a9ccef99117115e41e9adb271243bd5e985b
change-id: 20260802-tfa98xx-upstream-fa89ce77b7fb

Best regards,
--  
David Heidelberg <david@ixit.cz>



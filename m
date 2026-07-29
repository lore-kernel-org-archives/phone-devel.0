Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95831489869;
	Wed, 29 Jul 2026 19:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785353518; cv=none; b=etzBjPFc8EyfvC7Dya8sH6Fd1quQs0M48gFSfttbk5cEEdRA//mI8Oyx9t5eFx0DaKguEJjNSrtUWAYO4UcnFSYhmSVE76XZsiDfaxMq/FyGjEV0cuoBmjEuiImMIKVeXT+54YrMatvyL0YLbhzl4ZxP7C6/t1kq66s0zSCkDpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785353518; c=relaxed/simple;
	bh=ui8kY158w/vOloTWLLkXaCIXmhaSFnGgGqfPzLZawq8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FujDkr6E6/WKxRT5lONWyBUqaBcYNuaBIGSrOqvb6NfQ9c/WAxGznvUUHsHSMlbAWZrcb3JQ4TUJp9xXxGVbbMeyx1RcfhunK49MERXbzdD/H3uyyhiHraKib+G1VHW/ReNn4AZnc/OUw3DLJ9uvkEVlnsN3QgL7dSv+A9kITb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LPQKqiz9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LPQKqiz9"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E20F8C2BCF5;
	Wed, 29 Jul 2026 19:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785353518;
	bh=ui8kY158w/vOloTWLLkXaCIXmhaSFnGgGqfPzLZawq8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=LPQKqiz9vF16S7ZNRzj5jc9TNPmqDdeBRr1k1CpsE1DaCh5ter9ZsrIFWmPoej9v8
	 YUT0u5AU93oQxUSYPmJ6FKV0KnOfvbht8BYSKQoeNO3OjS0crfaMUu1HWQgGetiK+q
	 isPr7uNOpny6/l/Rd+Ciog36TDyGM1uFohdg2KS4OtcejlHv7KND6NbAjalJuv5Mnj
	 6EAQr2CTtkIfxPUZat6wNbKTb3QlWFW8PcmqLAd9G8JzQlK+befwJlozxszD39WAwz
	 +MkFB6nRtHhrQJ5TE5AiEFoT0rXfGgkeli2fI9HsFgu5R8aHn0Ka2tVsHd0Riewy2G
	 l2PQlnoAGewUQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCBAEC54F51;
	Wed, 29 Jul 2026 19:31:57 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Subject: [PATCH 0/2] SM8475 sndcard support
Date: Wed, 29 Jul 2026 15:31:53 -0400
Message-Id: <20260729-sm8475-asoc-v1-0-3edad8aa7628@proton.me>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ5AMBBA4avIrDWhFHUVsagajMRPOohE3F2x/
 BbvXcDoCBnK4AKHBzEts0ccBmAHM/coqPUGGcksyqUWPBVproThxYrEplqbWKkm0eCL1WFH53e
 r6t+8NyPa7V3AfT8mPdlYbwAAAA==
X-Change-ID: 20260729-sm8475-asoc-3c499a155b39
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Esteban Urrutia <esteuwu@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785353516; l=647;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=ui8kY158w/vOloTWLLkXaCIXmhaSFnGgGqfPzLZawq8=;
 b=1+d8VGyqqsWjOa8B3JJOh0YCFB9hMiaVg5gN0neu3MKpkQpLSrqyH7k7NKnPARn+TaZDI5mcM
 SwGv8czX+ruB7gA1oSSm0yoi4B3vy9jX8+97aerhvp9sx1oTpUzlKrX
X-Developer-Key: i=esteuwu@proton.me; a=ed25519;
 pk=wToFt4mOAWkzbqb15Ye1hrhevI13vK9BcMUFiQ/me1M=
X-Endpoint-Received: by B4 Relay for esteuwu@proton.me/20260622 with
 auth_id=835
X-Original-From: Esteban Urrutia <esteuwu@proton.me>
Reply-To: esteuwu@proton.me

Add the required bindings and driver support for supporting the sound
card found in the SM8475 SoC.

Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
---
Esteban Urrutia (2):
      ASoC: dt-bindings: qcom,sm8250: Add compatible string for SM8475
      ASoC: qcom: sc8280xp: Add support for SM8475

 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 sound/soc/qcom/sc8280xp.c                                | 8 ++++++++
 2 files changed, 9 insertions(+)
---
base-commit: 78bc8af4affb9a732504eb22eeac7d1e50883853
change-id: 20260729-sm8475-asoc-3c499a155b39

Best regards,
--  
Esteban Urrutia <esteuwu@proton.me>



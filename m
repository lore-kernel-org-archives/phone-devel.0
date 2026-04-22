Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC60D3B27EB;
	Wed, 22 Apr 2026 09:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776851322; cv=none; b=jNmExnJV7dRKk+tEnvBwjQ3uG1HUTmH3qRukj8/hUqYwx6qDraXc1HNH/ybGAQA8Bi8k5zIFm72eFl8s0fSZQz1E2yS/Lf+32yHlI6j+x/6Rg5FhvaE+uCdLd1X6dr/alDEniSU45SZoXbYeHG1a432A7pVSOpF7H1trSt8osBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776851322; c=relaxed/simple;
	bh=ylQzySUo9bDhSqmkcXiDS7XuuRz2rDXvl6KfxBGmTsY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AfcKNDNmaR2xvBQA5yoiMVIQM1zwc5aN+nrKlqhRFgx8ETnRf1dgIGKhCmr0WGa5a8DUBRMTFPkc3WnYoz3pNfmlvC2lwRWoIVD4274YKGjEzpzBQy0svs3l9fd1h3ZCfSUumA6SCMmhWsxxi++yaCMK9J5eMR2tvyawlIeq/xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GkXYBKBi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GkXYBKBi"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5C09BC19425;
	Wed, 22 Apr 2026 09:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776851322;
	bh=ylQzySUo9bDhSqmkcXiDS7XuuRz2rDXvl6KfxBGmTsY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=GkXYBKBiSiAosQIpUV9NZZYS6z5I+GVJO5OLd1/tAuVn+4L9TqZYKYtRw0wnjrDaB
	 aAaYbjSgXZWUN+MB+eK9nlTbfkDqf3Bma7c1Yu7HP/Ay50uwGc2au+X2c0nNineZ0P
	 0xdAXTdDmYaTxvURuo/OHq441TG7ZJxgKQ9+MlVm2qfs9AeChnOCkFkgdZ4nduz8Te
	 S/O8YGAHKlIHQpmS/3mskPQtU2VxxFXOdsYQehLDP2u70gPoAH++WDCaOVMKhBz9hf
	 6197KEK+HcorYseZQHaJyUQDeZsz5//s09RPfJqxcyU6hLRq/FJQJSairi64W5ynqp
	 M/htKahyT5EdQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 502F0F9B602;
	Wed, 22 Apr 2026 09:48:42 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH RESEND 0/4] drm/panel: Small Kconfig cleanup
Date: Wed, 22 Apr 2026 11:48:34 +0200
Message-Id: <20260422-panel-clean-up-kconfig-dep-v1-0-d825e9ffe911@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Dzmitry Sankouski <dsankouski@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: Casey Connolly <casey.connolly@linaro.org>, 
 marijn.suijten@somainline.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=763; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=ylQzySUo9bDhSqmkcXiDS7XuuRz2rDXvl6KfxBGmTsY=;
 b=kA0DAAgBYAI/xNNJIHIByyZiAGnomXih2X9v8Bfun+gaoBwp9eFzTbvsiKUw650qXY3DOpNqc
 IkCMwQAAQgAHRYhBNd6Cc/u3Cu9U6cEdGACP8TTSSByBQJp6Jl4AAoJEGACP8TTSSByfj8QALSE
 kxyBpbLRU7LCBQKbXXvtnVh0TMNEWO7u209TXCRBeMXcx53ZcI3PIwj5FDsXC1qtabCsQnyKyc6
 t5TLPgcsxDtpgpGRPGrsV5mlPCT/mPvME9iZ7d/XYqwpfuvOumYAc9ac2h78Ml32sxlF612dO+b
 7wLgFuYKP3m0Ap8WetqodFqqHeKJP2ZNAYFY2ARcHs87Dx3bFYAWYs0+ndTYKvtUwMNT013ZtSX
 i/35mLVSSfiJWqJy2oyQIgfunTm94zdAxgWulIv5rqamGSD+L7M/SjbLmfPOlS/Z6zOu1ga+eHE
 vWkrZiIoGDdSUq2oIqKjrmWTA//9N3o4WHrsjzrBccNBNko9xfw7F5K+DwQ/0z5PnCb25Nlsilw
 eqxLVAuQzK07mbxZncDUC9PD8CW58rdjQJw9JA1MLN0fluolVDE8toOVHgQdOKHQE6FMf5j8q6i
 wbMtbL4zc325UM63dDdSdrFT9eOqSxGgd7og+WNenJZrA36kUEOmb2NE6zrhxIGWr5Mn/A3XweX
 CtJNcdT9BPGQ0TZvmGfdF8zXs3ZzU5y7aTfjYaHThVZJarwWD7qrSApCiAkGQ1OiAuZq3qRrAPa
 8OGUHk2Hav1zkBTpLHL7AMMzAcxvzIJD8R1JAcxSwGewW1nNglyeiRmrwcjue8AvhpykRm+FwE3
 DJn4x
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

Inspired by looking at Marijn patch. Since Marijn patch is not merged yet,
appending patch to my series.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
David Heidelberg (3):
      drm/panel: Clean up S6E3FC2X01 config dependencies
      drm/panel: Clean up S6E3HA2 config dependencies and fill help text
      drm/panel: Enable GPIOLIB for panels which uses functions from it

Marijn Suijten (1):
      drm/panel: Clean up SOFEF00 config dependencies

 drivers/gpu/drm/panel/Kconfig | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)
---
base-commit: 877552aa875839314afad7154b5a561889e87ea9
change-id: 20260224-panel-clean-up-kconfig-dep-7dc39c351ef8

Best regards,
-- 
David Heidelberg <david@ixit.cz>



Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9615E784AC
	for <phone-devel@archiver.kernel.org>; Mon,  2 Oct 2023 14:00:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237609AbjJBOAU (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 2 Oct 2023 10:00:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237605AbjJBOAT (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Mon, 2 Oct 2023 10:00:19 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 336C39B
        for <phone-devel@vger.kernel.org>; Mon,  2 Oct 2023 07:00:16 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-504b84d59cbso7364091e87.3
        for <phone-devel@vger.kernel.org>; Mon, 02 Oct 2023 07:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1696255214; x=1696860014; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zpZhytU+mtyOMS/VgBxlj3+c2Lys7k0tYKY4H/RoMIc=;
        b=Ginm017MxEquRCV2mk7/P7g0EIxBqpgdlFFc7ndlsIl0p+gcF9qLJTWQWnOrjtC/b7
         aTYss4JN0kgNO9ldJWcgiv41quD7dWNbfmocFwf8rm/goUZ+ZkYk/seUIdx/X+jHqoMc
         4d0wef2VcqqhDtfQQrz6czzeY9EwwIBdjekyFsGWeSh9DISW0V0Qz0La+qAK0PP5/5ZF
         QXHYAJoL4a14hN3P7q/+MYhQiG3osQQYAhpv7aFCWDNfy422wW5K98XXcNRD9sgU5Q59
         h/tumQsNbAcPtEEADbrGhMwUqiSDmZ0svwYhKzJK2sCPWoFyMosh0z7W5ZgmRkCyz740
         h24g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696255214; x=1696860014;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zpZhytU+mtyOMS/VgBxlj3+c2Lys7k0tYKY4H/RoMIc=;
        b=E/W0shYAuHFCDan70pLvezLdIP4D1b0GVxyHxq4qwH5aJWPc3EHfgE0NOSFHcgcF7r
         r45QFd6t72Uwf/yssKGrOQ0dKGcR0AK7Q3a2j2YlL2vknqwhAlbhvnjPR94ZRo9TnliH
         mNlVGzvUV4ZcV5L9UkFm6ILf8qDB7xuh76/PX+k5BI8fC99V1hbmX3WSY0j+6DdiKhO/
         kDqPdUvL0e1e6lnjZ6QnhZM9xFV3dRM455jsrjjgjWnnHBWIFuOtrtCGuKfKFzRZI60R
         3LyhUXqN3A2mwPWFg42t0dAJe5Q+K0CKciCdvOJ4IDlYH6DPpSh63871nFwN4BcggOpA
         FNPw==
X-Gm-Message-State: AOJu0Yxfu2miC/aSVDcpxf5RAcICt8lIOKexH/vkma98cHfplPNl0Hbl
        f51Ve+1mphrj2+IswTElgHaBKA==
X-Google-Smtp-Source: AGHT+IGso9r5zHTjq+JheuE+Q/cqqFcdJ//IYpcalgTIQ1LdA5XgDbH9CA6sx9n8hYQEZLx5OnqiXA==
X-Received: by 2002:a05:6512:ba7:b0:4fe:db6:cb41 with SMTP id b39-20020a0565120ba700b004fe0db6cb41mr12425999lfv.39.1696255213950;
        Mon, 02 Oct 2023 07:00:13 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id q13-20020a056402518d00b005346925a474sm9350377edd.43.2023.10.02.07.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 07:00:13 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/2] Remove reset GPIO for AW88261
Date:   Mon, 02 Oct 2023 16:00:10 +0200
Message-Id: <20231002-aw88261-reset-v2-0-837cb1e7b95c@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOrMGmUC/3XMQQ6CMBCF4auQWTumHUQpK+9hWNQyyCykpCVVQ
 3p3K3uX/0vet0HkIByhqzYInCSKn0vQoQI32fnBKENpIEW1MmTQvtqWzhoDR17xwkoNhqkxDUH
 5LIFHee/erS89SVx9+Ox80r/1n5Q0ahzd3bE2J9tSfR2thGXyMx+df0Kfc/4C3Prpf64AAAA=
To:     Weidong Wang <wangweidong.a@awinic.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.3
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

The AW88261 chip doesn't have a reset gpio, so remove it from the
bindings and from the driver.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Include dt-bindings change
- Link to v1: https://lore.kernel.org/r/20230929-aw88261-reset-v1-1-fcbce194a823@fairphone.com

---
Luca Weiss (2):
      ASoC: dt-bindings: awinic,aw88395: Remove reset-gpios from AW88261
      ASoC: codecs: aw88261: Remove non-existing reset gpio

 .../devicetree/bindings/sound/awinic,aw88395.yaml        | 16 ++++++++++++----
 sound/soc/codecs/aw88261.c                               | 15 ---------------
 2 files changed, 12 insertions(+), 19 deletions(-)
---
base-commit: df964ce9ef9fea10cf131bf6bad8658fde7956f6
change-id: 20230929-aw88261-reset-7e00d9e25952

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


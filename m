Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63387C6FD1D
	for <phone-devel@archiver.kernel.org>; Thu, 30 Mar 2023 16:54:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230465AbjC3QyH (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 30 Mar 2023 12:54:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231444AbjC3Qxw (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 30 Mar 2023 12:53:52 -0400
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [IPv6:2001:67c:2050:0:465::202])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C71A7D316;
        Thu, 30 Mar 2023 09:53:38 -0700 (PDT)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4PnTyQ0XZJz9sTs;
        Thu, 30 Mar 2023 18:53:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dylanvanassche.be;
        s=MBO0001; t=1680195214;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=yw5UeIZa0PRwQ4TADlzPWSNt+mqlggJWWHWgo8amwkY=;
        b=VHvP4TAUn0G4VYLbirWKxAbIfZLSF+mEUYKqHQhDtDMa6RiXicVO8ZVKu17hrAUSHBLhIg
        wRRcYWl9okooTbVr2Xe6zv7LHYcI6TBIDTdaoeZZeF3pHKgw4/rJ+8Ybh9s6BVIK9Z4lRi
        SeKK3LKIbZTtTTJjPG1AY8Kwdbxv8hM4NH7gMfxdnjCcBzSPOqTZURxPswJ1TW2olDjozx
        oAXJPXWwjAExyZXcdnNzqxlL48gtltMW8M5glMU5aPCgrYinzUS+YyafU7Z7KQhicDDUIy
        bXeL9xDLuA6uZzKdsBVDpqJw83vYa0ct0onh0S/qfW2uTdS/UGTXeGkLELH8PA==
From:   Dylan Van Assche <me@dylanvanassche.be>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Dylan Van Assche <me@dylanvanassche.be>
Subject: [PATCH v3 0/4] dts: qcom: arm64: sdm845: SLPI DSP enablement
Date:   Thu, 30 Mar 2023 18:53:18 +0200
Message-Id: <20230330165322.118279-1-me@dylanvanassche.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4PnTyQ0XZJz9sTs
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

* About *

The Qualcomm SDM845 SoC has a separate SLPI (Sensor Low Power Island)
DSP for sensors connected to the SoC which is responsible for exposing
sensors to userspace, power saving, and other features. 
While sensors are connected to GPIOs of the SoC, they cannot be used
because the hypervisor blocks direct access to the sensors, thus the 
DSP must be used to access any sensor on this SoC. The SLPI DSP uses a
GLink edge (dsps) to communicate with the host and has a FastRPC interface
to load files from the host filesystem such as sensor configuration files.
The FastRPC interface does not use regular FastRPC Compute Banks
but instead uses an allocated CMA region through which communication happens.

* Changes *

This patchseries completes support for the SLPI in the Qualcomm SDM845 SoC
by adding the SLPI to the SDM845 DTS and enable it for 2 hardware devices:
- Oneplus 6
- SHIFTPHONES SHIFT6mq

* Related patches *

1. Remoteproc changes (v2) to support the SLPI DSP in SDM845:
https://lore.kernel.org/linux-remoteproc/20230327183736.496170-1-me@dylanvanassche.be/
2. FastRPC changes (v2) to support the SLPI DSP in SDM845:
https://lore.kernel.org/linux-arm-msm/20230327184204.498032-1-me@dylanvanassche.be/

This serie does not depend on any serie, but all of them are necessary
to enable the feature in the end.

* Changelog *

Changes in v2:

- Removed double blank lines
- Enforce alphabetically order for 'slpi_pas'
- Reordered 'slpi_pas' properties
- Fixed FastRPC syntax
- Dropped qcom,assign-all-mem property as this is not necessary anymore

Changes in v3:

- Dropped FastRPC dt-bindings change, unnecessary to relax the bindings
- Add reg property to compute-cb for the SLPI on SDM845

Kind regards,
Dylan Van Assche

Dylan Van Assche (4):
  dts: arm64: qcom: sdm845: add SLPI remoteproc
  dts: arm64: qcom: sdm845: add SLPI FastRPC support
  dts: arm64: qcom: sdm845-oneplus: enable SLPI
  dts: arm64: qcom: sdm845-shift-axolotl: enable SLPI

 .../boot/dts/qcom/sdm845-oneplus-common.dtsi  |  5 ++
 .../boot/dts/qcom/sdm845-shift-axolotl.dts    |  5 ++
 arch/arm64/boot/dts/qcom/sdm845.dtsi          | 60 +++++++++++++++++++
 3 files changed, 70 insertions(+)

-- 
2.39.2


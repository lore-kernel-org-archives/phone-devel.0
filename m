Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F075C54EBE
	for <phone-devel@archiver.kernel.org>; Sun,  8 Jan 2023 20:02:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231378AbjAHUCz (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 8 Jan 2023 15:02:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231398AbjAHUCx (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Sun, 8 Jan 2023 15:02:53 -0500
Received: from amity.mint.lgbt (vmi888983.contaboserver.net [149.102.157.145])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EB65BB3
        for <phone-devel@vger.kernel.org>; Sun,  8 Jan 2023 12:02:51 -0800 (PST)
Received: from amity.mint.lgbt (mx.mint.lgbt [127.0.0.1])
        by amity.mint.lgbt (Postfix) with ESMTP id 4Nqnny0NF7z1S5FJ
        for <phone-devel@vger.kernel.org>; Sun,  8 Jan 2023 14:53:58 -0500 (EST)
Authentication-Results: amity.mint.lgbt (amavisd-new);
        dkim=pass (2048-bit key) reason="pass (just generated, assumed good)"
        header.d=mint.lgbt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mint.lgbt; h=
        content-transfer-encoding:mime-version:x-mailer:message-id:date
        :subject:to:from; s=dkim; t=1673207637; x=1674071638; bh=9dsgbhg
        A9vnJIYjG6YuVbFl47O4RVEcVJHNR4rpiPy0=; b=S7DFo29vG7NE++lB/KVaZp0
        nrepaawVim1a0f/1HbiKJR77Ir9pw2YybN3pnoTuiBodrGQQfKJf5FEeJR8PxMZX
        GadUzYM6HMlL2ZSVaZ9nOnN8uMz5bsphyEyDxPhpww7BNT163qM6DzD7D0Qal5tQ
        4tDLoZGTXZYoSmWZyPk3P92EvtlVNw2htRi1wft+2m+r0zh0tIV9sK+tabnBcw46
        vaHoSbu1R3qE8cEVRj5aGQ2KTHl6zKyC08tTTxSPdVwycCAxgGtf5NiHmZWkMNmB
        1erNm+vORdKHgjtqXjatcYEHo5QoglTPUe2FKUZeyGjp4naEXhVuiBSv5Ra0TNQ=
        =
X-Virus-Scanned: amavisd-new at amity.mint.lgbt
Received: from amity.mint.lgbt ([127.0.0.1])
        by amity.mint.lgbt (amity.mint.lgbt [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id Iumcj5kqNNTo for <phone-devel@vger.kernel.org>;
        Sun,  8 Jan 2023 14:53:57 -0500 (EST)
Received: from dorothy.. (unknown [186.105.5.197])
        by amity.mint.lgbt (Postfix) with ESMTPSA id 4Nqnnj34NHz1S56d;
        Sun,  8 Jan 2023 14:53:45 -0500 (EST)
From:   Lux Aliaga <they@mint.lgbt>
To:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        vkoul@kernel.org, kishon@kernel.org, alim.akhtar@samsung.com,
        avri.altman@wdc.com, bvanassche@acm.org, keescook@chromium.org,
        tony.luck@intel.com, gpiccoli@igalia.com
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-scsi@vger.kernel.org, linux-hardening@vger.kernel.org,
        phone-devel@vger.kernel.org, martin.botka@somainline.org,
        marijn.suijten@somainline.org
Subject: [PATCH v6 0/6] arm64: dts: qcom: sm6125: UFS and xiaomi-laurel-sprout support
Date:   Sun,  8 Jan 2023 16:53:30 -0300
Message-Id: <20230108195336.388349-1-they@mint.lgbt>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Introduce Universal Flash Storage support on SM6125 and add support for t=
he Xiaomi Mi A3 based on the former platform. Uses the name xiaomi-laurel=
-sprout instead of the official codename (laurel_sprout) due to naming li=
mitations in the kernel.

Changes since v5:
- Drop "non-removable" property from ufs_mem_hc for sm6125 platform
- Drop "status" and "autorepeat" properties from gpio-keys node for xiaom=
i-laurel-sprout
- Rename "key-vol-up" node to "key-volume-up" for xiaomi-laurel-sprout
- Drop "gpio-key,wakeup" property from key-volume-up node for xiaomi-laur=
el-sprout
- Set "linux,input-type" and "wakeup-source" properties on key-volume-up =
node for xiaomi-laurel-sprout
- Change "key_vol_up" node name to "vol-up-n-state" and its label to "vol=
_up_n" in PM6125 GPIO node for xiaomi-laurel-sprout
- Use labels instead of node names for PM6125 ADC channels in xiaomi laur=
el-sprout
- Set "regulator-allow-set-load" properties on l4, l5, l10, l11, l18 and =
l24 regulators on xiaomi-laurel-sprout

v5: https://lore.kernel.org/linux-devicetree/20221231222420.75233-2-they@=
mint.lgbt/




Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0783CE79A9
	for <phone-devel@archiver.kernel.org>; Tue, 19 Sep 2023 23:03:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229935AbjISXDo (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 19 Sep 2023 19:03:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232649AbjISXDo (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 19 Sep 2023 19:03:44 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 427ABC6;
        Tue, 19 Sep 2023 16:03:37 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F064FC433C9;
        Tue, 19 Sep 2023 23:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695164616;
        bh=/Dcw7zKC8BcBHNTeIR44kvNUH+eJPDiCfQUsI4Z5I54=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rCclC7fIhDJmgNDXlHqsdnjDeyHaEABcJWcMB2oy6ta2zyQ7K3TIfp0Xi/73mq5ti
         NrCTFJGnwrvfkkl0vbIfeogl+eXNyzWiuPbXgyQpJg3TiCm/JzCCt9QlQFn6O3NOnZ
         8rkVxX/NzgEZZtkIuG7iaJ47hnaWpksnrbaL0cS1j5ybgyfncJAgtC9Dgf5e8qImOT
         sns4X861QhvvPXJNiuJw1wpKIu8vpAws8wilxkQ1fy0ATZZKtRNv1fWpjS2gOtHOzL
         CEVgoXV60Fms9j8TVrogasL1Se4NGh0b8LhP3TcCM4Mtl5x97q9QJd6riCQtE6w++0
         OOTC4kW7xY1uA==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: sdm630: Add support for modem remoteproc
Date:   Tue, 19 Sep 2023 16:07:28 -0700
Message-ID: <169516485985.787935.13554174726198807178.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230719093458.2668842-1-alexeymin@postmarketos.org>
References: <20230719093458.2668842-1-alexeymin@postmarketos.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org


On Wed, 19 Jul 2023 12:34:58 +0300, Alexey Minnekhanov wrote:
> Modem subsystem in SDM630/660 is similar to MSM8998 and
> device tree node for it is based on the one from msm8998.dtsi.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sdm630: Add support for modem remoteproc
      commit: 09f1642eca6eb6d25a630214098350dc02917954

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A3D8C77B7F
	for <phone-devel@archiver.kernel.org>; Fri, 12 May 2023 15:43:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241892AbjELPnD (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 12 May 2023 11:43:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241907AbjELPnC (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 12 May 2023 11:43:02 -0400
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1627440CF;
        Fri, 12 May 2023 08:43:02 -0700 (PDT)
Received: from g550jk.localnet (unknown [62.108.10.64])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 8F364CEE75;
        Fri, 12 May 2023 15:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=z3ntu;
        t=1683906180; bh=Fid7yfw9t/u6WzqpvkhxPRW/PgqKY+ilcqxq2iSSnso=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=byb3Azt5b60NPc42TTCeq14cYY8E3/f0ATm/iJ5NNlh0zmNouIpxr4JKo9V1VPcub
         awwwpN65xGFSP1+H9VAg39LNFrTRl9eM5/P15+EwjsBU4ZC2DRFTazF06TjvCwkeVM
         r1XUuxrIygGXw6fB7o1HRFi0c5eQiBSWfj4lHmx4=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: Add BLSP DMAs for I2C
Date:   Fri, 12 May 2023 17:42:59 +0200
Message-ID: <7012043.lOV4Wx5bFT@z3ntu.xyz>
In-Reply-To: <ee580939-8334-4d86-e01b-54c6fd0b2f42@postmarketos.org>
References: <20230422-msm8953-blsp-dma-v1-1-0024801bb587@z3ntu.xyz>
 <ee580939-8334-4d86-e01b-54c6fd0b2f42@postmarketos.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Freitag, 12. Mai 2023 12:14:29 CEST Alexey Minnekhanov wrote:
> On 22.04.2023 14:39, Luca Weiss wrote:
> > MSM8953 has two DMA controllers for the various I2C, SPI and UART
> > busses. Add the nodes and configure all the I2C nodes so that the driver
> > can use the DMA.
> > 
> > Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> > ---
> > 
> >   arch/arm64/boot/dts/qcom/msm8953.dtsi | 48
> >   +++++++++++++++++++++++++++++++++++ 1 file changed, 48 insertions(+)
> 
> Hello,
> 
>  > arm64: dts: qcom: Add BLSP DMAs for I2C
> 
> to all qcom boards? Or only for msm8953? Commit title is unclear.

Right, missed "msm8953: " in the subject ;)

Thanks for catching that!




Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 217A9C43332
	for <phone-devel@archiver.kernel.org>; Wed, 10 Mar 2021 16:32:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E382864FD2
	for <phone-devel@archiver.kernel.org>; Wed, 10 Mar 2021 16:32:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232437AbhCJQbp (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 10 Mar 2021 11:31:45 -0500
Received: from mail-40133.protonmail.ch ([185.70.40.133]:41242 "EHLO
        mail-40133.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230156AbhCJQbT (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 10 Mar 2021 11:31:19 -0500
Date:   Wed, 10 Mar 2021 16:31:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1615393877;
        bh=JTijYTZLi2CdM3+gIg9QyCWX8PO1vMPplDJG6vlWoCE=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=OnyIQtqq+ikCEn+yIVcYQcL1bsKmdMF3k+dAnX9wb015wGwASViIjVnzNE5I+OX/v
         90X+KlluGW0lXC1ifuNcpw0VF3fvOS3kQsXGqqOoIBu3WOiS5rWeNYVQ6MogqN4GMP
         I48fmKbIleOGaMu7Js4EYdjpIzhugyGbyN9d6snM=
To:     caleb@connolly.tech
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: arm64: dts: sm8150: start populating qups
Message-ID: <20210310163024.393578-1-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

The QUPs are rather sparse, lets add the zero-th and second qup nodes,
the iommus properties for all of them and the i2c nodes.

With this it's now possible to bringup the touchscreen on my
device, and without crashing!

Derived from OnePlus 7 Pro downstream kernel sources.

=09*Caleb
---
Of note, I'm only able to properly test i2c17, as that's what my
touchscreen is attached to. Enabling i2c18 causes my device to lockup
during probe, I suspect those pins are used for some other purpose on my
device.


Caleb Connolly (3):
      arm64: dts: qcom: sm8150: add other QUP nodes
      arm64: dts: qcom: sm8150: add iommus to qups
      arm64: dts: qcom: sm8150: add i2c nodes

 arch/arm64/boot/dts/qcom/sm8150.dtsi | 549 +++++++++++++++++++++++++++++++=
++++
 1 file changed, 549 insertions(+)




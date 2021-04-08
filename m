Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C79EC433B4
	for <phone-devel@archiver.kernel.org>; Thu,  8 Apr 2021 16:20:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6407A610E8
	for <phone-devel@archiver.kernel.org>; Thu,  8 Apr 2021 16:20:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231655AbhDHQVG (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 8 Apr 2021 12:21:06 -0400
Received: from mail-40136.protonmail.ch ([185.70.40.136]:49242 "EHLO
        mail-40136.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231893AbhDHQVF (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Thu, 8 Apr 2021 12:21:05 -0400
Date:   Thu, 08 Apr 2021 16:20:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1617898852;
        bh=b+OdMUUk9Eq2QLLRDRz5C3FbA7WlnSCxQu4FqtE4xo8=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=pKJurOYqmoOFG3kbgqZ7pJk+tH7bmi/Bxb644wv52Wk71jqIcuZ4pXkqQmcUA9FVa
         QVhm1UQYF5Gn0NWJusMrjKCkxKkm6T7lQYBNF68MbRXojjuSsqD6FAAz/lo0m+0pju
         MRMf/4UVMKEvxYD0Kco5F45wH/oisYXYMiDLZers=
To:     caleb@connolly.tech
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: v3: arm64: dts: sm8150: start populating qups
Message-ID: <20210408161953.26298-1-caleb@connolly.tech>
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

Changes since v1:
 * Pick up Reviewed-By's from Vinod and Bhupesh
 * Squash second patch into first
 * Add iommus property to dt-binding docs for geni
 * Fix i2c19 being mistakenly enabled by default

Changes since v2:
 * Fix iommus definition to just declare the property and maxItems (Thanks =
Bjorn).

Caleb Connolly (3):
      arm64: dts: qcom: sm8150: add other QUP nodes and iommus
      arm64: dts: qcom: sm8150: add i2c nodes
      dt-bindings: qcom: geni-se: document iommus

 arch/arm64/boot/dts/qcom/sm8150.dtsi | 549 +++++++++++++++++++++++++++++++=
++++
 1 file changed, 549 insertions(+)x



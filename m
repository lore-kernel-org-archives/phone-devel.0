Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9029CDB468
	for <phone-devel@archiver.kernel.org>; Wed, 11 Oct 2023 16:51:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232919AbjJKQvc (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 11 Oct 2023 12:51:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232748AbjJKQva (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 11 Oct 2023 12:51:30 -0400
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B2C09D
        for <phone-devel@vger.kernel.org>; Wed, 11 Oct 2023 09:51:28 -0700 (PDT)
Received: from [192.168.178.23] (k10064.upc-k.chello.nl [62.108.10.64])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id C5B75C88E9;
        Wed, 11 Oct 2023 16:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=z3ntu;
        t=1697043056; bh=m9Y2fWOjnYX/0xKlS3Kqt2jobeES0/OAjuwxXHcCnT0=;
        h=From:Subject:Date:To:Cc;
        b=B0eA9ezwNSOqcv0FDw7xF2gS9pphqPlWP+POW6XCFs3Ef3UgH2flR0A0b7kcZDtqD
         Du5fnwCOtyZ+z6nXKxXnRupawT14VW+JSHC8pOOQAwuYAT1iStaFDhqCpMqlctNrQw
         k3ve051OixjpwgMxL2yCiAxIrUco3l6ImMIyR6KI=
From:   Luca Weiss <luca@z3ntu.xyz>
Subject: [PATCH 0/3] Add support for HTC One Mini 2 smartphone
Date:   Wed, 11 Oct 2023 18:50:43 +0200
Message-Id: <20231011-htc-memul-v1-0-97c3910f80a9@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGPSJmUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2NDAwMj3YySZN3c1NzSHF1zE6NEC1ND8xQjkyQloPqCotS0zAqwWdGxtbU
 AK1PIklsAAAA=
To:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Cc:     Luca Weiss <luca@z3ntu.xyz>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1149; i=luca@z3ntu.xyz;
 h=from:subject:message-id; bh=m9Y2fWOjnYX/0xKlS3Kqt2jobeES0/OAjuwxXHcCnT0=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBlJtJsue9csmWk/WH4vZTeCNakB7KC9CTDlYF0A
 koNSilt+/yJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZSbSbAAKCRBy2EO4nU3X
 VpDEEACrK3f5FONAA0gWStl0bK36VtjPtTXHZIu5t2SCJmS4UXpwYp9ui0xc1WK7pR+P7BZwJWs
 h4/sxPDCwLdJfdjTbLzVhH98ns5LYgXEqoQDgn0tivQL0kb+liPz1bQZRlAi2+CTu8ACKyTTB23
 NlP5CVx8V6T69lG/+OF0wwHlqBxjyOKSZmSY0/eX50AZWcggVWG5bQGjIDdWdGQnhQD7PoAlhGk
 YYyJLAfVtdNG1WPH+qgtc1guqNQg2EN4zoM8bbZrYUa9d/tC9hnS5UUyvAHayZcUqRhy/Rr2e6W
 VPoFg5ttY8cBnOjcj7xbUhYpoevN7pj/lNEhBfSYbq6QxofuEGUDD49+yMWqD1CTbEazETA5eTt
 /BYg5VY6oGoL+vf6ESkpxoDAqoBbYUJ6sbGF7c9a5ldThJno6TruFkgth3CRQShSHUlwlfQUrW/
 /aqsmlRwKdr2VU33SuGJPGl89y+mt31M4DLDnPf8avaeC3tsbPZth+utUyDogo82K/kPPycHmBo
 NO90OGHNhPO7iJkO5FjxugkhnCFF3w9pRrvnSeYhHVrcnemN47oAk/QHXMdU7maaSxy/lJ445GL
 sl2OripX0jJ9DXCseKYRJ7zvbcU+tEJn8ZWIq0g929Z6TFpR6QCWEd14Ydad6J3dL4XFoRhZG2T
 WprflED4YV7N6XQ==
X-Developer-Key: i=luca@z3ntu.xyz; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Add support for this smartphone from HTC which is based on the MSM8926
SoC and codenamed "memul".

Depends on, runtime-only, bootloader enables watchdog so we need to pet
it to stay alive:
https://lore.kernel.org/linux-arm-msm/20231011-msm8226-msm8974-watchdog-v1-0-2c472818fbce@z3ntu.xyz/T/

Depends on, for dt-bindings & Makefile change, could also be re-ordered:
https://lore.kernel.org/linux-arm-msm/20230930221323.101289-1-rayyan@ansari.sh/T/

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
Luca Weiss (3):
      dt-bindings: vendor-prefixes: document HTC Corporation
      dt-bindings: arm: qcom: Add HTC One Mini 2
      ARM: dts: qcom: Add support for HTC One Mini 2

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm/boot/dts/qcom/Makefile                    |   1 +
 arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts  | 337 +++++++++++++++++++++
 4 files changed, 341 insertions(+)
---
base-commit: 4a914c105417214fb38cd124317f174247c0a426
change-id: 20231002-htc-memul-742a8517d24b

Best regards,
-- 
Luca Weiss <luca@z3ntu.xyz>


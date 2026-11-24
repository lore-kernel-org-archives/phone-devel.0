Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795557781;
	b=lDI5e8C2vdyx/Ej8BpphSAXAf1D8WoIRmK73kc/fX4HG5n8JsIhlj8jOLUcVy6+XR3Cv
	 Y8Kjs+J5IG4iNwlPxygWgXL+K3vOAeto7hNYWB+zAgi+RFNo2SI9zxYTJD3MpfSnHIBLh
	 CQAd93+PbEwAsKH1o1PFHjCR+a5JfpeTJZPcuWWjRIgHLAHg4UyhQdY8SgfxROuY1fI9a
	 JnWaKsAUlxwYNDmAoE49kb+Gjacn0EkTlwQIVDXNb79Wp9bDWiZCkKFAl0r2yq+2UeeHn
	 eKEUmzPGWN6JYXSqsPc7WQr+8IqZbRB6e8M8q6DMDG1HWegVEyiLxs/lXbMNnRv1DJA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557781;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=yqSNzruG07jwQaPwVKFS1LEgr0ZuJsVIG8sfjHpXyOs=;
	b=O4idbVvKnyPXCu7Gd0ucCvw2kSaA5BKkA9KBw26BwCKc/yp4d2d+jemgBXdqh4U/Yr44
	 sjxyQDjEgmg6e/8e0BjwsGIHHWkjRmOJc8Dv3aQwRKoSI3qEHn0i9ixHYZKIFVbKXX93t
	 zTo7Z8WKaLaxEOBgRu6JkfU62NuMvfD0fmJbg3RCcrC+MJ77xvgUKYlw394rwjO0agB0K
	 0OEWnDz7xkK/8Nla916x2/HbU0aspzNaGKXPgw7zrjtV3uwrCwj32cneIw74UF3BMvuzA
	 aYwg8OoLVU4bT8H2yvZ2DXqbhpdf3oOnQak5oVyMHu+9RgIlmlx3vFXZ7d2xKQ2A2jg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TH6Etpqe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC93B606A323;
	Tue, 24 Nov 2026 22:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TH6Etpqe
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795557781;
	b=zp+Gn7KAXRHpZyfnniZMyPmjRaYmprrELA1f4Ctl6WyvIWpFTFv8+suRduTTn45T9I3d
	 tuLYkZgLejXNqhSfpyjZYAVUG1AdUm403lipnNIGHNka4DpKAy6LBytiG9vmsIjI3LUhs
	 JT/sivH3mo5sHNmC/d/CP3HIGKAO0C15wrJJ5wk4kDYkHEYdumXEECIw+al4u854DXO1c
	 sW+chSBJ4ZvLfR/bs3j3lFh4vqRPhuVQD/8nKDaD/n1TzLIqpmar+kaETMckw0IvThbZ2
	 xbcLkWw+xVVTTOm47GKdHORZFVdKQNjEHR+GXOItlQVhQNwoLYck6ZM46kxZue8lp5g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795557781;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=yqSNzruG07jwQaPwVKFS1LEgr0ZuJsVIG8sfjHpXyOs=;
	b=AIRd56IqA+PumoEcLod1uGTNPe3HCxt40nqOBtmPyYnvWCGiM7MXtvsssPk0Vown2gN6
	 iSnq7YEnrFY2mWH1WDEAs+1hdN5gI+wZUTTlwjs3JevrN3R3wlIibQ0+YwrVXJQApL7p9
	 DxShgTw3yDC0c3r2Xz4VfnNi2tbJH2v13rhXoY8L/J1RE98n1zUDnF31ZdWdH5A7kuvpc
	 l/0s2bH/PvZqDbxyKMWLQVEJd1U1lAy6ipCTkvphCgsNKd1WqNav2wuZIX0fzDiNxz3rK
	 JsOeftHObXS5hprR2jGZezt8QGlmaj1TTfKlliF/T2xzMpzQybZtn8NkiZDF6Kv1PpA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 978B51F000D3;
	Tue, 24 Nov 2026 22:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795557781;
	bh=yqSNzruG07jwQaPwVKFS1LEgr0ZuJsVIG8sfjHpXyOs=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=TH6Etpqegdn1DMto6xKK51Liren1EN/WaD7U9SVflvoeeV3HRN3aiSaIz07R66+k6
	 wBOEW16K9o0L/SnuihwWFeYdpTvFZpjiCzbYMRq3ozBhuAqFctEk95x3MIUmLUnmRY
	 rE3wQpuw0e6bMmjKbhYQWm905cZ5tPJZcVEUq5ZgfqAvxkATfRnoP9NlU/Q2rl56GG
	 9n6IHSozfpZQ+aOvxhRq9raaomLrma6R9FPpv9C7MF32vxCUk7+YeG4gQ8abPK/1ZN
	 sVE18wU6ocR0kBeGI6FZQXNXAtTRf4eBK5mP7Q2Oed/BZVRLzC6wngMRlnO8RkbTj4
	 63yrUKyyK0ZUA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 18F2E4CBBA;
	Tue, 24 Nov 2026 22:02:49 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 24 Nov 2026 23:02:47 +0100
Subject: [PATCH v4] media: qcom: camss: Don't reject sensor links faster
 than 4x the CSIPHY timer
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261124-csiphy-sdm845-limits-v4-1-f39f9149b62e@ixit.cz>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XNywrCMBCF4VeRrI1kJr3pyvcQF00ysSNeSlNLa
 +m7myooLsTlgZnvH0WghimIzWIUDXUc+HqJI1kuhK3Ky4Eku7gFKsxUgSht4LoaZHDnIknlic/
 cBmmAtDOlT50uRHytG/LcP9nd/rXDzRzJtrM1X1Qc2mszPLsdzHd/Eh1IkE5nyvjcxozfcs/ty
 t7FHOjwQ6wh+UFgJDJEZ9IyI+PVN6HfBCjMfxA6EjYt1pATJKDyDzFN0wOlc7/vTgEAAA==
X-Change-ID: 20260822-csiphy-sdm845-limits-b1e3dbaf5d38
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Bjorn Andersson <andersson@kernel.org>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3233; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=ochRMDocSCeX7Q8h0M1gcBIPdY3ayiUWJfkM116gdZ4=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBrBgmIfWQ8kSxonNKGJu66CneXdPYw15r2NNJLO
 OiPPPEZlN2JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCawYJiAAKCRBgAj/E00kg
 cuXuD/9woMc8aXmQRwX/klS4HBOrhKnWOdHCx+CqlQASJ6KXM2UP3OiVqfwUFjeg74wu+Fqr7li
 VW2g/jK/fmUrVZDchZKZ7wABQrkJlTC6sW/tZJBVjWTe5FuM0oRTeSRrNsxMNkOSCm3aJwnlwcF
 PicfOLHXVEMzBRBH2YZ/dqpsyIFC+ONY+y2LIgni+yCoIp5hH/vTx4mlQai5fUgDWXJ/OunT1Ts
 Fe4yLzcjVaxtA16bOWb1RMoNUx8xxMel3tQHDIiPhEcmnTyvw/UT8Tyef7Tm9ogQ0yHdPn1k9Kl
 sC8uPr6hbD8Mmsmo71bzbiszimmMt9Bv57bKVSm6sWR/86VkUCraoAcdR7ShAv613Wq4EIUG2dt
 3mCQQ2JjOo3WNeDr5uQ0wTEG4ANZ7hv1vUi5oiqQ/pCNAF8cbHEp3D9FmRP7LzcGaVD/Vd0r25o
 2kam/INm9jDLtRcZFXYrnC3CjaomGL93h+jym2324De2wk//KxLLeScNbWoNaZbSk4/ly+U/RQf
 lRknt/rIkBS9cHAtRzjaxrpAu+ccOdWxLlO2HxU3J7Lr2wD/z089mu2hcF0fSqmsm5dyfgVc66M
 ZVNONOg6VfPDrcNhBVPpymXRrQFfh5kKeaB4O+CY78d3pib8TVDF9RTEETRaWKKwOA1jvIye9Wm
 9UhKuqHJUHzMijw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
Content-Transfer-Encoding: 7bit

From: David Heidelberg <david@ixit.cz>

The timer clock has no such relationship to the link rate. Both the 2ph
and 3ph code use it only as the reference for csiphy_settle_cnt_calc(),
where a faster link makes the settle count smaller, not larger: at
269.33 MHz the count converges to 16 as the link rate grows. The vendor
driver pins the timer to 269.33 MHz for every sensor (it is the highest
rate in the SDM845 clock plan) and streams this exact link with it.

Clamp to the highest listed rate instead of failing, the same way the
unknown-link-rate case is already handled.

Solves issue on sdm845 that caps the link at ~1.02 GHz,
so the Samsung S5K2X7SP, ~2.3 Gbps/lane, link 1.15 GHz) fails with
Pixel clock is too high for CSIPHY

Fixes: bbde31047434 ("media: camss: Use optimal clock frequency rates")
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
Tested on SHIFT 6MQ with sdm845-next-20260820-9.
---
Changes in v4:
- Fix stranded ` and rebased a top of next-20261120.
- Link to v3: https://patch.msgid.link/20261027-csiphy-sdm845-limits-v3-1-c58917e14107@ixit.cz

Changes in v3:
- Added R-b and Fixes: tag.
- Link to v2: https://patch.msgid.link/20260914-csiphy-sdm845-limits-v2-1-622db5a6ebf0@ixit.cz

Changes in v2:
- Drop the camcc change entirely; the 269.33 MHz ceiling stands. (Konrad)
- Fix the check in camss instead: clamp the timer clock to the highest
  listed rate rather than failing, matching the vendor driver.
- Link to v1: https://patch.msgid.link/20260822-csiphy-sdm845-limits-v1-1-d360bf7cd38f@ixit.cz
---
 drivers/media/platform/qcom/camss/camss-csiphy.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index cdb803843792c..459175709670f 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -159,25 +159,23 @@ static int csiphy_set_clock_rates_legacy(struct csiphy_device *csiphy)
 			long round_rate;
 
 			camss_add_clock_margin(&min_rate);
 
 			for (j = 0; j < clock->nfreqs; j++)
 				if (min_rate < clock->freq[j])
 					break;
 
-			if (j == clock->nfreqs) {
-				dev_err(dev,
-					"Pixel clock is too high for CSIPHY\n");
-				return -EINVAL;
-			}
-
-			/* if sensor pixel clock is not available */
-			/* set highest possible CSIPHY clock rate */
-			if (min_rate == 0)
+			/*
+			 * The timer clock is only the reference for the
+			 * settle count and does not need to track the link
+			 * rate. Use the highest listed rate when the link is
+			 * faster than the table covers or unknown.
+			 */
+			if (j == clock->nfreqs || min_rate == 0)
 				j = clock->nfreqs - 1;
 
 			round_rate = clk_round_rate(clock->clk, clock->freq[j]);
 			if (round_rate < 0) {
 				dev_err(dev, "clk round rate failed: %ld\n",
 					round_rate);
 				return -EINVAL;
 			}

---
base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
change-id: 20260822-csiphy-sdm845-limits-b1e3dbaf5d38

Best regards,
--  
David Heidelberg <david@ixit.cz>



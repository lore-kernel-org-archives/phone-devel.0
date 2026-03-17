Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5A735F18E;
	Tue, 17 Mar 2026 22:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773785555; cv=none; b=dvM4XJPvlodyE1B1y+ItdHGannJGeCQbnk6nr7/WDKZR3LCgIzFnSparTmYHI43jC+4DkvtK+R2tU1u76BQbqlcao8Euzf4UC83CiNGFQyR5HzoWQ5Pgzz6S9XogXWeXBB4y1WcsTj0j13lSdrsDK+z/o91TBO+pO05DrasKHoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773785555; c=relaxed/simple;
	bh=Pzzmign7Hy4szkEHrZUkoI+XLqdJUVJ2mA0Db6ivvGU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k7CnlYZ1eqKM7uWFgheyib8TI4DbRez8Fv9wdmrM5qxTqRiP2LWN+NcZeFgcpzO3IC7j3mnxaPs4pYrHs/sX0AlnVDe+gO8qmwdEasH3u0eOYEuT7MCMs3x/AJvSAwh4Yl7OCB1tpkuLiaCPj3lhy9JDtUXCeiLiCjWme4J4zcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tA5yxOjc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tA5yxOjc"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 27C2BC2BCC7;
	Tue, 17 Mar 2026 22:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773785555;
	bh=Pzzmign7Hy4szkEHrZUkoI+XLqdJUVJ2mA0Db6ivvGU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tA5yxOjct2iTyg/GC3e1EpzvL4i/kfA0isYnlfYNfnoeVtgZYfrUghE2EktjwAcwn
	 Qj6UJeTjnrbBq3zrn/7zwuyrXRm9EUCMMVNw6VEte29169IoJBac8U2cvNziddQVqD
	 oROCenYNDqQQOi62NpgxjOz0uaor412v/zF4hkFKYiKuRTWaBw/c36T/A1QQHYZ8YF
	 k5RkzfkH9yVLQrLPadF5sF2+nqxaAV5BDZKCt440MAn2Tik88rtxiY2O3Lc+qbTKhV
	 zIApa5qbV7q/g1TtDrTyCUG47xEPYZnY7sTJi4Z2iusLbxj3Pb7YgKgDlnqaFyHGPo
	 XMaDhwnIHSjFQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D96BFF6E8F;
	Tue, 17 Mar 2026 22:12:35 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 17 Mar 2026 23:12:35 +0100
Subject: [PATCH v2 5/5] arm64: dts: qcom: sdm845-xiaomi-beryllium-tianma:
 Disable MDSS
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-beryllium-fb-v2-5-36b69dfb760c@ixit.cz>
References: <20260317-beryllium-fb-v2-0-36b69dfb760c@ixit.cz>
In-Reply-To: <20260317-beryllium-fb-v2-0-36b69dfb760c@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>, 
 Sam Day <me@samcday.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Petr Hodina <petr.hodina@protonmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=960; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=3Pg7NvtymOOJ0LjoaS8anANtqZcNQW66vxuq+tyshlk=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpudHR0dYPx2NAiTEfwG9J2cJNYLUHEIUq2Fqrr
 p9dyPncKZaJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCabnR0QAKCRBgAj/E00kg
 cgj0EACvjR2Ds4u6CWeByHcVIabwWqa5Ly6NdWfhFeXL3uuKD38KDCa5nBLIB4W1CKbGJBRKfaq
 8KYEjGW3H31ePbPLayVGHvNdTn73Y+vlMffFP4tP83ulyG4Dr3C630nmUqbEpXwWXKNpZkLwXRT
 GnSW48Nt+QJjQnrOi4vMZKJMYl2q6A4n0UdJgXNaZP32jtaPyOpt3d14T6GRGQPnReGgQFTfT38
 btkGY6SKOtlPL8dNxLS9aHFKb8ZaPH8YsQiDm2nHHtNP+kZy/nJH6k8zG8k38g/Eadaf5P29qER
 pozHIpixetaB4Z7MEZwByZbtbG884BCItGQz66iMCYP7uazdfot8x7FyTNBOOL1dy52HR4qejLH
 4dYmKYvKjEDq9O+Celt3IeBPbqC1HbXs9VoJNRlfuthWHBicqlUHPZaIY7jrY5uk/jwJUW6dNUd
 4XzkswT3nx/WC2AagO8gagQTovfHLJJktieujrHUuA0JYz4OPuLkD6X4hDTUELvpvUcel7tUdyF
 ExYk+Tdax9uH02Xf1IOo/bjz5pnlS7jXpL6M2KV8XNNocKS7zFTq6KUETeF4lu1KHWw8vsaoG81
 L2bQOfbvRbkjxPx82qDAaaZQr21ngVgPpWLV04AjgYWBjI0JTaWksPimneVJZgnlX30Uc9tOdpN
 C0bXxrbeTCPH65Q==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: Petr Hodina <petr.hodina@protonmail.com>

Currently the panel driver for tianma is broken.
Disable MDSS to prevent DRM taking over the framebuffer.

Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts
index b58964cde8342..d1c7bccaab500 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts
@@ -36,3 +36,13 @@ touchscreen@1 {
 		touchscreen-size-y = <2246>;
 	};
 };
+
+&dispcc {
+	/* Disable for now so simple-framebuffer continues working */
+	status = "disabled";
+};
+
+&mdss {
+	/* Disable for now so simple-framebuffer continues working */
+	status = "disabled";
+};

-- 
2.53.0



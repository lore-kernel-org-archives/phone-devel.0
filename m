Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795189996;
	b=fGH93jKIruekA5h2Z/G2D1nF/7O/EVNRAa0mTaQbdOt8t2aG4CBBhDcepDjWKfz1rY/y
	 W2v6Eh8pOhDo+jWsArGovlsG5Nlj8qFe72NKNkmQ55rCNBSsJWEqmTtJ8glQYBEJRIgDu
	 jdTw7wOJfkXzwEy4bJ5jXD1u2v3o2NaPBMazJMOJ9AO0W8lFey6HP+x8LgV2LX9Yawzvd
	 uqPMX5HES817AtNWPf9BRAn/Vy8KoeeM3wy9zY8SLpcWRbT43Uxb+Ez0+nfcTAu/HtlCb
	 nvp0q4r4b+K8RxxB3atj2n67ALsP5vAxTN23NUFFAAZOuebAZb0OqKxTUoImOF57evQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795189996;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=meT3QAiTSr3qSxGWIp+z3THNZElxOl7c3Peai+6jn9U=;
	b=YeqOue8Ef4K2yCvqclarv0g5iZR5KwsVAWmu4kf31BrYfrhGCghEEjBngWpQZ9X9x1wx
	 japt+qEJWcvg4XYVgBNyxhW7y0xz+cHYENc1rUkqPLF0cjzmbEIx7vRGzjCyJExh1amgI
	 NQMetqGGlZZAMAqWGE/WLuf7evPNGH8K3QIlIGQXkbu0GD9Eg4at98YM1tnzEmTfAFq3I
	 2cB/wqLtwSHSleVpThfnN2mhVlMRQIqia4p6xB2reRfLUDPRHCV7RIasP9Jm+Ng+WUJ6S
	 037QyIpALCE94f6bciorEK2Esa7llA3Zz3+eAElEKUSFIAtsRF863eU0AeUrL1sNC+g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k1a84X4n;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33860606A325;
	Fri, 20 Nov 2026 15:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k1a84X4n
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795189995;
	b=QnFr1lrBN+iI6ZeISNaRds5rsMqyT0qCOEo4yYa5CmIi54Aya1AeshqOPrIT8+l9BGR5
	 dMwg3OpYCBZajURcMa5doZAhMJhAZlP5ryOjyLHAmRUoB7xqjc6Jwz8v6z9SoZls/Gr/A
	 OS8XlOr6pv3lnkfZ6PttT9hizBSzNEYxF9YSlzlQ1VR3KT5LH+VfHKkGHGGS4zC35KTRH
	 5FoWRhpCzQ8aYRYH5fzqkfYfVpB5SXTMV4HcNOZrkuR0AHjDdSSUJghFIyQBD1rwMJgd+
	 4XO4FQVxLQcYGsEyRzl9e6Nm0LHuLPX2qaXKKGCXG94mi5uCGET8wvL7tSZHY74AyWw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795189995;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=meT3QAiTSr3qSxGWIp+z3THNZElxOl7c3Peai+6jn9U=;
	b=BiraV/WrSInT554JaunuCTzBV9PiHsFm5b4ZpzG5B8xZIJWX88EyrhZ50dujtlMLOjBN
	 GX1s3FIka5SpyIj+PqaHeeQd+uBOPR9vzj24S+z/adbQnzTMlHQf+iSpj2OFydnS2EJLE
	 MS4O3ytAe/FO0uPSUbB/3RjkMv/LH21U8/0usBT/KdMuun98J9DZbYhemUI0F4b8coul7
	 BB9KhBlippHkbBWkr9G4ACbaVTDWGLRIgpf6ojFJlaSKc6/yQA4VzTNn6/wGU8W4bMDQ2
	 QYfwuh5bnR5v7Zcv1tNIDvfnjwqK725TsGFZBnaKURrTFVvWZyAXs2MoBF8ZTXXKYNQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 72F221F000F0;
	Fri, 20 Nov 2026 15:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795189995;
	bh=meT3QAiTSr3qSxGWIp+z3THNZElxOl7c3Peai+6jn9U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=k1a84X4nv2KtWiudf/WclQeBewWBiGDavggvumjtUxAjQS2LpiuOhX4tTuu/Js65c
	 HwOGLIM95xZm3swxBCcAuDPJx10QBLepY4JgYAvYlWPqeIKuujIVe5o75QUr+WcEp+
	 j7ZXbBD0LmQYr/qONqAfB4gvyp21+jPXyNgEguhRCKFtlg1CRYLxI1qT+rHn+BQy67
	 RlKIz+mN5nCGEnFYxkqmMpH5E0FrpGo1o5U3jJq3pi2Vj3gEWzikeSIrKJbI1d5+1i
	 deRza/3PV57sRHx6qtLtXgCxE3qJAwHk684E0yfKTTL68WAV7EKxZ0T+NBrZ4sU0Eq
	 SvcME0sMQcA4g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 039AA49936;
	Fri, 20 Nov 2026 15:53:05 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Fri, 20 Nov 2026 21:23:06 +0530
Subject: [PATCH v3 04/11] soc: qcom: ubwc: Add config for Molokai
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
Message-Id: <20261120-molokai-soc-v3-4-403d763685d9@yahoo.com>
References: <20261120-molokai-soc-v3-0-403d763685d9@yahoo.com>
In-Reply-To: <20261120-molokai-soc-v3-0-403d763685d9@yahoo.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Venkat Yadlapati <venkat.yadlapati@yahoo.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795189983; l=1024;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=9lI0GDLg+ArIvmjuhBkr6Hwen5svXhSHz+Z0e79/fbg=;
 b=DhLPA89PnQONu7tt3pNu4UmkHWZTOSr5NzQ1FSSUdwtqiRozDM7VEH5LIrtuUPdPGkF5LslrP
 0+H/rBh/EGsAeFgNMd1UxJVAJKpjEmvc6gKj7FGh2rnjyV3N3cHmqYi
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reply-To: venkat.yadlapati@yahoo.com
Content-Transfer-Encoding: 7bit

From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

Molokai (SM8845) uses UBWC 6.0 with a highest bank bit of 16, like
Kaanapali. Without an entry, the display subsystem fails to probe on
Molokai based devices.

Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
---
 drivers/soc/qcom/ubwc_config.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 456995699fdb..7c1166c68551 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -130,6 +130,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,mahua", .data = &glymur_data },
 	{ .compatible = "qcom,maili", .data = &ubwc_7_0_hbb16, },
 	{ .compatible = "qcom,milos", .data = &milos_data },
+	{ .compatible = "qcom,molokai", .data = &ubwc_6_0_hbb16 },
 	{ .compatible = "qcom,msm8226", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8916", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8917", .data = &no_ubwc_data },

-- 
2.56.1



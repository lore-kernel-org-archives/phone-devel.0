Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B0C330328;
	Thu, 23 Jul 2026 02:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784772619; cv=none; b=aQB4+9NMa4y4lbEgK/CWH61+vepha3VBBxwk1D7Uyqt15RkliYVvqx0/7te+yA0SZn1GaMYPZhcYt+7Ugxa4+uW6dcWQYk6JPpeauXTXf4Pmc6nYxWXyKwapYHy8hkhdAH93p4jC/6Ouhrlktvtvu+2jgNznINOAR+G1pwKvf2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784772619; c=relaxed/simple;
	bh=oVQd39UDoufgoPV9MVO4P+cpqxa0bAHqW7i0Rkg/YGU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X34rkzTJaNyU53s0Ffq0ApEH+Ryx9l4seL0cE9ehJ23rhyPo1R2IYT7/cMJtpbt2XGlpS8uVPfrR9k0OYhO4aateV+Gu4obnTvh9Wp9R/RbZTekfbmFC9Pmnvof+YczfqIl1IWRwodQAGsVvRF8pK9vxhbaMt21PKjETqKmYzQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=Gou67e2J; arc=none smtp.client-ip=109.224.244.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="Gou67e2J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1784772604; x=1785031804;
	bh=oVQd39UDoufgoPV9MVO4P+cpqxa0bAHqW7i0Rkg/YGU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Gou67e2JwKJubJOBbgNhPt9ddH9BdMnn3uAbU/yk7ErAmNFJruEKvDQwQihJIMRwb
	 IVtVfAkB68ospeZqahuvcPj8724RU1lVU59jfhvVRtESjVYfuK/dBjgtyKnCsyr0lA
	 JNQqeiN08tXEMTGoXeHHrskcUGb75HKPTOeejxvduf99u8Ct8iVyrMNJZ1C4GGklte
	 23ubij355ipibb3WNpivu/9oK2XlE02nHj9Z48aRFRpV4uN7u83VD3Kjbt9cb9N0vK
	 VqERUepy/ak0xgI2FH7mxZUW4zcDwDegmMaMkp4tkzpqDVM8NoI6uwFBQ4uWhyi1Vp
	 KMkS8TVWiTyAw==
Date: Thu, 23 Jul 2026 02:09:59 +0000
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
From: Esteban Urrutia <esteuwu@proton.me>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] phy: qcom: qmp-combo: Add SM8475 support
Message-ID: <9e85cb8f-fe99-442b-a516-46dee7f72a12@proton.me>
In-Reply-To: <20260722-sm8475-bup-usbss-v3-2-0dd5da218ab2@proton.me>
References: <20260722-sm8475-bup-usbss-v3-0-0dd5da218ab2@proton.me> <20260722-sm8475-bup-usbss-v3-2-0dd5da218ab2@proton.me>
Feedback-ID: 147889766:user:proton
X-Pm-Message-ID: dfdf654f40cd626fe20093bccce809bd06340ed4
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 7/22/26 10:00 PM, Esteban Urrutia via B4 Relay wrote:
> Some SoCs such as SAR2130P, SM7550, SM7635 and SM8475 use 4nm-v1 PLLs.
> For SM8475, trying to use qmp_v6_dp_serdes_tbl structs (which are for
> 4nm-v1.1 PLLs) causes link training to fail because of ref clock
> differences, which in turn makes these structs differ.
> Add structs for v1 PLLs as well.
Taking a look at commit 545069bcf39e ("phy: qualcomm: qmp-combo: add suppor=
t for SAR2130P")
it would be great if someone could test these changes on a SAR2130P
based device, since qcom,pll-version is also set to 4nm-v1 on this
platform as can be seen in [1].

[1] https://github.com/LineageOS/android_kernel_qcom_sm8450-devicetrees/blo=
b/lineage-20/qcom/display/display/neo-sde.dtsi#L69

Regards,
Esteban


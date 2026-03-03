Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FCB39098E;
	Tue,  3 Mar 2026 06:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772520075; cv=none; b=hzJmAFCwGqCeHMdpuzO5K1LbZtvu9jSIFbm5B5Dj3EUwpFNYwNymTX9+EN6FpaqkNo9OjnIL0nxNHoizeAyWtDFcmd6lgHGDxl0mbO28f1vWalUViaCFnNWU1esREYTb3os0O+iwFj1Xsp1DjJWB/tCWQ1HfsIXJnv0K57Rq4uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772520075; c=relaxed/simple;
	bh=Cwm50ylfevANRzYIb/eotdmZ4xDlq3PqRB4EDBJoxCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GJyD5cuyVaPaqIQ29MA0JdDY7nW01TXz9D1HufN0D/uOmV+tYCNr3VxebwkWE2C0ArS1IO7kEZF4bZo/zGJ7IsQhfby8H6h0RZ4krbyJs6EHH/ZNa9cYKecazhn83lT3H2gZHCewrj4EWaX3kuJi1SdR+n/U9vnlzx6TKqA4Ih4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y2Dqf9e2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y2Dqf9e2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C658CC19425;
	Tue,  3 Mar 2026 06:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772520075;
	bh=Cwm50ylfevANRzYIb/eotdmZ4xDlq3PqRB4EDBJoxCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y2Dqf9e2kOM0JrtCSAgxJnQSN2LrUVp+Azb3dLk7IBYKAqYs7jqT90Vp7teVDSGO6
	 F7AOaRJmj0G5EtQ1kQgIrI021/hQI7AFn8Weac3qKVICIdRY/J13XFGHJ4vq73oKkD
	 8QIeXmw2FVxPwZAwhpxgntBGJ237+7dfA6Y6JapXN6HvsG2ehAILvVM0BY00UZHIPJ
	 ih0yBhwK9hNCpD4brVKXlVjtNCg2b2OZvFIBnDWp5aC76j5OJB8/QqCbomWPmgx267
	 ZFozFC2XmEMjeuR3LkUpB9s58INZvzrM/gDO90oGJ6RkLYsFvXIMTX6eqULaMoY0LD
	 MOOTQffeYUKJA==
Date: Tue, 3 Mar 2026 07:41:12 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aelin Reidel <aelin@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux@mainlining.org, phone-devel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom,ids: Add SoC IDs for
 SM7450 and SM7450P
Message-ID: <20260303-spry-awesome-giraffe-120eca@quoll>
References: <20260302-fillmore-socids-v2-0-e6c5ad167ec4@mainlining.org>
 <20260302-fillmore-socids-v2-1-e6c5ad167ec4@mainlining.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260302-fillmore-socids-v2-1-e6c5ad167ec4@mainlining.org>

On Mon, Mar 02, 2026 at 02:10:14PM +0100, Aelin Reidel wrote:
> SM7450 and SM7450P are two SoCs of the 'fillmore' family.
> 
> Signed-off-by: Aelin Reidel <aelin@mainlining.org>
> ---
>  include/dt-bindings/arm/qcom,ids.h | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


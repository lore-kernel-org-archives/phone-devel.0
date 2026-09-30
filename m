Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F134E5348
	for <phone-devel@vger.kernel.org>; Wed, 30 Sep 2026 15:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790781025; cv=none; b=XAgV7mYZWjjYQQIMccYC9KjZnOTWSsLsEGa9hl4Rd3IFw6rUM51Q8Y8qomELUWIl96/5IO6BR7ezacRBgSNSVnFB0O4MKvPCcNT5YoZ9zIzbnU7FQtfLIRH2wVwR60clNzxvfIQs/S5AXMN5ibUEYq82NDaWSo9OT3DCmEpK5UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790781025; c=relaxed/simple;
	bh=0OxRhuVbi3oxUlatW0tIcyIVYkE96Nbu7bqC/b0fLyE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FZAZ7U/dZaBIPB6u5AZwpF3/yoMh0YMp9Q/XDMieIMdSZJfHY2EAU9myS6QfR/l0Emarc4ggaXJum4L5BpYMtHDC+4X8QQTobS8oTbTPD9lYivy4Prckh2jlcKb/v9kUQ5pyKZ5KQ1hY1pT2bOyVnjlC/E411gH3EwrEMlMAW+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=he0CNuvm; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="he0CNuvm"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba330a7e46so1652444e87.0
        for <phone-devel@vger.kernel.org>; Wed, 30 Sep 2026 08:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790781010; x=1791385810; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fPmto+vUBoK3BPeCZ82QESLiZxY5p21rVFK/tfyP4vM=;
        b=he0CNuvmm7mjhNkF4WGGazuow9mh5t+GmnSTZSQy5jsvCel0poBTrP51IwdlwBLnJz
         SOl/VdtAqwaENxDFiRJhFspv8fOnReUXgu1QoU3fPJpQUvQltdg9KSBwHLnw1jXWmApV
         xOcG8/PIYF7JINRm9JaI9wkkjoCI0VMKH+45R1UwoUUR76LiJBm9fC4BxYPIGyIwrZLE
         MsRxtkJjNgUG89WHmbwNtXugRbmNbzJSRU+Xf8opZxMshnembivB8FS79EJpauf4cx7c
         kLRSSR1LMpWgkQ54bUUXCf7KtLFC+X4LNwv1jPXXkjnpT1nEANYfQTKJtPM9HdCn7d3J
         f2qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790781010; x=1791385810;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fPmto+vUBoK3BPeCZ82QESLiZxY5p21rVFK/tfyP4vM=;
        b=awCOC/VYDOCrqJtcubkNZGyLuklZu6jXScce25jqpnLnBRzsy9CUV2S3yqQmJenqlk
         b6byFTVHXlTvKYq7mYakcNkdNXdxe88XHcaAhuLm9iisTSkEoSqZe94yZ/dof5zwZbkM
         k4SZNbsJeO5nZAzKaGWdSW2EN4CzrHoELf030gfgJWH4B0R26xAvAQ4A/Ca77ZGzo2U5
         Ag5mzzz99im+EgTwMon2Kl9j0HQX3/pL/XI0YpV1hMmxPzWiDAC6ve8oMvmrP6DOP5Ji
         brqxaeSlV0qaOjfGrfCpQ37I+5yy03hnzixtwgODvt346W4CwuJEUAAmQIjJFd2V8xgD
         svSA==
X-Forwarded-Encrypted: i=1; AKwUvBw1bmNJ4x6mMb6hAfOIQ9lD6Pox4NbY/TpQyXy/8p3EoLSUsdZXwleryUyYWSotT9UZnzdu+uCI7Fwn6Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8X631/aZyIUyCoZnWCNOkFpSOxo83TrtxMAOCAdSins5s6LaE
	XfS06EwAZnZpVZ9O1slANXDN77DPcaK7iotNjtB9qNa8uN6qY3yJe8pK
X-Gm-Gg: AYBFou2aOWtmKZ3tZLO/fRgKYyOGoViBhd+pREPnvy8FxN5CWFNBFTSHRggcpY0kkKz
	CQig4ddVpi6djPn3YiemWnbnQbZDyieJXi0d9Y/277lQlEt6KB74HjPKuNzREofuqJtmzbYgnl6
	PvDgzcGFOx7Iju8/qS6aS+8CqMEPWpe+EStgJBDRUxo/2TRp0i3040E1XAtWaP+6PgZ/NownMM+
	i6/nl5bllF4p3qOmETh1aWYQJrUkj/UajavwT5Ed7dAadkIeIK4lPLtVd40uxqXlm30WY6nvuxh
	VSB76okTKW8VOdEWbupQtdLyS1R52dR3ZHKKiDV7MLTxyJhRNUyjGa+Atw9lnxxDOnHQabcSsRn
	Nuln+jFIFRJfjTZ4DjewXUSWs5txQAxLN2BeyMm5UiYudwdajEhY1fdHQaec2ZOJho89gpgs5gj
	vRjNAIzgQijCAM53RUhFFyCL93WkachwmciWojSoKYa+kgfx8T0gl7L2gBLVJlgW2ObZiq8ucgi
	Se3d+Cwl51XQ7Bu5AQHaX/GSWbFNik=
X-Received: by 2002:a05:6512:3ba3:b0:5b8:f955:29e7 with SMTP id 2adb3069b0e04-5ba402c323emr870452e87.6.1790781009538;
        Wed, 30 Sep 2026 08:10:09 -0700 (PDT)
Received: from [10.249.180.52] (m-37-0-171-147.cust.tele2.lt. [37.0.171.147])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba42faaa70sm29075e87.27.2026.09.30.08.10.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 08:10:09 -0700 (PDT)
Message-ID: <82fded25-6338-4aa1-8bb1-a49834cca8ba@gmail.com>
Date: Wed, 30 Sep 2026 18:10:03 +0300
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH RESEND v3 0/3] arm64: dts: qcom: sm7125-samsung:
 add initial device tree for SM7125 Samsung platform
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stefan Hansson <newbyte@postmarketos.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 David Heidelberg <david@ixit.cz>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Vitalii Skorkin <nikroksm@mail.ru>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260910-sm7125-samsung-v3-0-c467bea0fb9c@gmail.com>
 <179065170983.2673486.1587443995547415765.b4-ty@b4>
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <179065170983.2673486.1587443995547415765.b4-ty@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


> 
> Applied, thanks!
> 
> [1/3] dt-bindings: arm: qcom: Document Samsung Galaxy A52/A72
>       commit: 0f14172198733b780f22d546516ccf8a7ed77733
> [2/3] firmware: qcom: tzmem: disable SHM bridge for SM7125 platform
>       commit: 6320b4c31b70a39a06de27a8019a45632beef32a
> 
> Best regards,
Hello Bjorn,

I noticed that the patch for device tree compatible documentation was
picked up, but the patch for device trees themselves was not. Is there
any issue with it I should resolve?

Respectfully,
Erikas

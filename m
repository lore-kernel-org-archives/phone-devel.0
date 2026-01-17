Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CB42DAFD7
	for <phone-devel@vger.kernel.org>; Sat, 17 Jan 2026 21:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768685960; cv=none; b=G7GfolJsVU3p1gbpmqkXFLyOTQLBHWMA1KFDwgkzfm1iyXwK14Q5z0k8qKptPlj83c0MXbTsWIHDm70KjaYHK/r+qnqJhsqHmuHBNFIj7AQ0cf/404a4odaUVd17Of/7cdmRmFbbxnSLh4xT7fJde7LWxkP4QCgmqsPEDeZezVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768685960; c=relaxed/simple;
	bh=bQQpwrCGrpO5QyLkGXEZAd9BSGvrhb7OYadOB8Pl6dM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eTMAB640x+l3aT7UBxzRuLDOEYEHVyVgHQaNb+AVK9yJMf8TpZcKcLgKXAPeimPYw79kRtgvEiexBxf02Ecbw9IaC765XUKKypeerVr9xn8BM5xj0AM4NSWMdiHUZfPQ/JJ5UFe39XkLJ/sGM474+X6srxLubEAwNTQic1I34Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=anMYnoCD; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="anMYnoCD"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-430f9ffd4e8so1898547f8f.0
        for <phone-devel@vger.kernel.org>; Sat, 17 Jan 2026 13:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768685957; x=1769290757; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bD2NimiMGHu9BwaTt8RzFFLJsSh/fccLMhaDQFOrDmk=;
        b=anMYnoCDyVylagM7GI5k8NsI7/jGscbHon/60P3i7udwmcKFfDMDVEPA+HnRibA8NV
         aKytr/eIX9V9QxwfuJXFyG2SJ8iULMJHDy5WJMSY7vFlYAFQTNrkc1wZ+/lnWsCDYiSw
         m7qwYl9XnGH6LCyqTPXgcFxUA4BARr//fdCIFSN3w/xsPFKwJsME4c+9X21fBBM9xDvy
         TK0dE1nwraOCCnoDvw19QAQsZ8coMs/ANswegx0HC+hgMeVAcaH1PG+TMqpPXDxAwK9F
         aaLm9+bbBrx820+ANFW0ue65uyLLNqB99fFVxzeFri/RSchAF3GvOPn+KeIWjLzQ8B7g
         3QiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768685957; x=1769290757;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bD2NimiMGHu9BwaTt8RzFFLJsSh/fccLMhaDQFOrDmk=;
        b=F7vcXHNG98KsbA2RqcWuDXVPdorpE6G7Feh8R86nFBOSdFDrZeAdPhXoGLgGSc9VXi
         gUMLY19sGkyjgEds8P4YNF1WEM/z0kaa7YkLVGJVNSUpJ8HzFpsniUgIBQynA9qdL2JF
         +FgScv0l0SO9lrIn7GjE18ko39uafumz/Xn1YvQuiye4yc8wLCYryn8vWvd3rB8goUVu
         uTIOKX4hFpIrgR0d187cPtcJolFUZsW5WtQcwcVRvvW9Whi9PrczsHERHnLBsGDTf/QC
         YcQIXwHDqN14KnchK6Bu2kvxV1UgfJQuSKZhAEettt91lmyWAsnE4yqK8NUCGcUueFrM
         Un3g==
X-Forwarded-Encrypted: i=1; AJvYcCWF9yisqXlotTWid9mE4/n7cVe7Zi9mPvY18AouGoKN106RPXNbGTuOsn1zLZaXFmrsI8S9lvyj8v+eXg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4i5Vuf5d6gf1xqcw7RYz/xSbRpg+VeyYNo97Nzak5SmnQ/mU2
	EfUSHs+zaZrONzACL4kSazu6FPCWsNaGLUMP1wHnxzEi+AKSD16jTGAsuF8/c36GQnU=
X-Gm-Gg: AY/fxX7kcD4AoCx9ZaTBanrTubSzr05xQYsCtnMyYkjnwBN4cEMHPFg5VsaTZ+vgIrX
	YzBgrJjGkLz+PSuJntrc2ujitk+efSUwBXIIc4iu6sOOjWvrfJdh0WVJx+MxdifnVPW8kKxoi+P
	gbKeHn09CQpL3siehYS8IQtPC2mEgQuTFDwFb20uaOkkFXxSSdf7VYH1NZlfU67M2O9svV2ZFfh
	2r89hTsYB719x5gTenOxNLxmSe7PFpR1jsEZfOBrRztz5rC1SJLJ3X64B9GvHvOEPLvybtGx9qO
	yD13+TzQBuEY6WbT0Zs/Y5vGBfKp5ygxBM9bFntUmrt+fPfkaW5vyMC3ssixfhtWbeVPBGrKycM
	RfV0NsEiZPNbptegedVck6U4Hitm09ALkXeh7fK/OFfWwaFKzliYGudxvfedjHTCEQNhy0kQUKY
	9gxBoWu9WJ+3kohsCnbo7iD1DhhIVCEidSlI6Gk60kyAkgfHkCKyZi
X-Received: by 2002:a05:6000:18a8:b0:431:cf0:2e8b with SMTP id ffacd0b85a97d-4356957840cmr9582526f8f.29.1768685957500;
        Sat, 17 Jan 2026 13:39:17 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435696fbea8sm13316568f8f.0.2026.01.17.13.39.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jan 2026 13:39:16 -0800 (PST)
Message-ID: <7c561993-ab7b-4ddb-a36a-47a000d5d435@linaro.org>
Date: Sat, 17 Jan 2026 21:39:12 +0000
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] media: qcom: camss: Prepare CSID for C-PHY support
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Joel Selvaraj <foss@joelselvaraj.com>, Kieran Bingham <kbingham@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260117-qcom-cphy-v3-0-8ce76a06f7db@ixit.cz>
 <20260117-qcom-cphy-v3-3-8ce76a06f7db@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260117-qcom-cphy-v3-3-8ce76a06f7db@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/01/2026 15:36, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Inherit C-PHY information from CSIPHY, so we can configure CSID
> properly.
> 
> CSI2_RX_CFG0_PHY_TYPE_SEL must be set to 1, when C-PHY mode is used.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   drivers/media/platform/qcom/camss/camss-csid-gen2.c | 1 +
>   drivers/media/platform/qcom/camss/camss-csid.c      | 1 +
>   drivers/media/platform/qcom/camss/camss-csid.h      | 1 +
>   3 files changed, 3 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> index 2a1746dcc1c5b..033036ae28a4f 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> @@ -183,6 +183,7 @@ static void __csid_configure_rx(struct csid_device *csid,
>   	val = (lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
>   	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
>   	val |= phy->csiphy_id << CSI2_RX_CFG0_PHY_NUM_SEL;
> +	val |= csid->phy.cphy << CSI2_RX_CFG0_PHY_TYPE_SEL;
>   	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG0);
>   
>   	val = 1 << CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN;
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index ed1820488c987..b50b0cfe280c1 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -1275,6 +1275,7 @@ static int csid_link_setup(struct media_entity *entity,
>   		csid->phy.csiphy_id = csiphy->id;
>   
>   		lane_cfg = &csiphy->cfg.csi2->lane_cfg;
> +		csid->phy.cphy = (lane_cfg->phy_cfg == V4L2_MBUS_CSI2_CPHY);
>   		csid->phy.lane_cnt = lane_cfg->num_data;
>   		csid->phy.lane_assign = csid_get_lane_assign(lane_cfg);
>   	}
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
> index aedc96ed84b2f..a82db31bd2335 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.h
> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
> @@ -70,6 +70,7 @@ struct csid_phy_config {
>   	u32 lane_assign;
>   	u32 en_vc;
>   	u8 need_vc_update;
> +	bool cphy;
>   };
>   
>   struct csid_device;
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

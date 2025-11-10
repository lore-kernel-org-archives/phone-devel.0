Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14DF3074B7
	for <phone-devel@vger.kernel.org>; Mon, 10 Nov 2025 11:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762774677; cv=none; b=KDIQDTgo7ilvkP5UhB0eOuzMDjpAYF3BLSJAuxGUT7CqA385F3F2ZnZb/Jrn1iBrY/1NR9b4BlDOsUqs+OWMct/CTkJXU1pArzmNCOxCWWIhVOfvJGnuspX4TENBIoeZRig/km8LIeu4H/X0rM5+sLN3a7czhUyIK9ilyIznZY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762774677; c=relaxed/simple;
	bh=bYvCRDJ8Gv1dOfdRqfRo9yHHV4IK3gLVIJ6PseVpKNo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N7iNLLWPdr1mlzVNPoh0FaUHTm507GaYcO1GJisAxIoTozyN9YY4WV1tAEnZPbhZ4eURmmLSl+hgCLvSeZqz4rlRFmledK9JovtR5gDWZIbrawPJtFSIYFBxj20+KR/AoLzPwLhjuYnBESHC7LeZkOc3glvZH0orq1YTp3x1uJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GK4xGvDu; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GK4xGvDu"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42b32900c8bso730176f8f.0
        for <phone-devel@vger.kernel.org>; Mon, 10 Nov 2025 03:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762774674; x=1763379474; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lbIPi1f3TQjYD0qdQrLeTSWV5sgjs9x+ZurWSxF6us4=;
        b=GK4xGvDuKd3J3N0sFhw+qRe8dRFQj5wcWAsGkekk3jTlXEPJBJCtpwGfDw61uAmiTJ
         TJqDU7HOfO+3wwsSW/zBox6lNgj++WhnkbuVx+kbIpPH5aFq/PyjZmG9OcgHmPw6DPHQ
         taa8VW8ykh0uk9ehI4Uu/NThH21j5xy94btfr8F/IMC/mCNzwNsNJ88Svspja7jzgGkp
         0Y5UOXzBYVEPmrMOF2Z1lux9cQ1xmp1QglCEnaLnl67dm5bP9AOuu1lxqJv0nQ60Sn3J
         pa9VC0QTkqrDzgjJjX8UpN+nrMivCynm72+Y9wCFdbdKiE1JyHwXS16I/VEIAx1zJKlb
         sq4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762774674; x=1763379474;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lbIPi1f3TQjYD0qdQrLeTSWV5sgjs9x+ZurWSxF6us4=;
        b=P28+fxHqz6GI8zUFj6YK1LFbbBiXtN3vWulw4wRaKEnU/bWYmVO5+J+a4sn82Si75g
         A6JDOTEqd6kVdDuz7GJxBbWDucTVQd07XOLMnltcwYNuqlJhLz+oJqbo/uHlixvMpgPU
         YvjjmxQSGSUOGrZQxLgK/mWMtBRsPv4+yqCCbm3GDqjkL8BmoJu0oGmRGYXS38Dbxp4d
         UySo7BVIKmOC3KQMYqW0U42XJeM1zdMzim2w0Og8nRu97h5VeTXjROvB382JeU5E6fua
         Vtuz2sBCz34vpxRR0IziwFWq20c/rGzTakJ38vDxHsz4khxmQn29O8bS13WbjKEVEm9+
         eN5w==
X-Forwarded-Encrypted: i=1; AJvYcCVE0z+a7HmvOWo25Z1QH1rNb6WcHdpKXRaM0Ac4j2sqYNrU2rmdNVH/fw6EzykPncHqo4WNhd8FSXCsmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyiXlNLkrbDv0ix7H5Ef014XgjqW3aziWbv2NAMQJbdRCBK0wEd
	OmGQoh7fiYlnyx5SuhKZd3qpdi/yGjUrlj3ZgczJQzgPoc2q2ytG6MI6Kx5h/+BWWY0=
X-Gm-Gg: ASbGncsNQL1kSRiaNTOKNI6vrh1CnEpeZddh+Vw52FJPj3MWzl+BbafmVDSkrLckKOe
	4ScY1rwFJYV7RRNkiNP46/XxNvN57cSZxnpI28QWA6rxNPFbo8jBSzNWun7PDNvg1zVYNgOZHt+
	fycWD+8tshDvbVIAStZ+Zpi4sj5buMGyZ7MrdkqDJ5lSkuEdfUrQ+giGoIHzjpX/goMxxpq7huK
	SMnES1qpsV9mBzbbQb4tDCfjeBkVYkWlG5VW5M7Kc/io48gtnM6nOYYrp5EOYymUsJJo7iYMduO
	VT4XJ5l+N57Z5addUCNH1Ir6FqwfW7x+2I1TXauXteGmYsT1oQ1Yf/1ARQmUmQuEzTjCC6IxXGZ
	PVoqQO/DHQUnZy+hlo1/2SYtDFVrHMelChBE8cV3apk0uso1UvCszpT3N/jIoiDeJYKxtEMAYon
	gyiBMj0hgtq5v0w9+i2Xzc8la1V8m63Fu87mtqo8gpnoCmFYZJGIG2
X-Google-Smtp-Source: AGHT+IHA0EBLJZJ+ndV4OQ/knM5PV3CmaEKbnGaPdN8RNMmCv96/hD4FMnZxtX3a7xuoueGlr3MwOg==
X-Received: by 2002:a05:6000:613:b0:42b:39d0:638d with SMTP id ffacd0b85a97d-42b39d06632mr2610262f8f.28.1762774674004;
        Mon, 10 Nov 2025 03:37:54 -0800 (PST)
Received: from [192.168.0.21] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac677abeasm22015186f8f.33.2025.11.10.03.37.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 03:37:53 -0800 (PST)
Message-ID: <c65411c8-fe15-4cc4-9236-2232c55e4b86@linaro.org>
Date: Mon, 10 Nov 2025 11:37:52 +0000
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 4/8] media: qcom: camss: Prepare CSID for C-PHY
 support
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Joel Selvaraj <foss@joelselvaraj.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20251109-qcom-cphy-v1-0-165f7e79b0e1@ixit.cz>
 <20251109-qcom-cphy-v1-4-165f7e79b0e1@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251109-qcom-cphy-v1-4-165f7e79b0e1@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/11/2025 09:39, David Heidelberg via B4 Relay wrote:
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
> index 5284b5857368c..68adea33cc719 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -1287,6 +1287,7 @@ static int csid_link_setup(struct media_entity *entity,
>   		csid->phy.csiphy_id = csiphy->id;
>   
>   		lane_cfg = &csiphy->cfg.csi2->lane_cfg;
> +		csid->phy.cphy = lane_cfg->cphy;
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

I'm not convinced you need another flag for this. It should be possible 
for the CSID to get a pointer to the PHY and interrogate the encoded mode.

---
bod

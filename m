Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B038A3F4108
	for <phone-devel@vger.kernel.org>; Tue, 18 Aug 2026 11:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787053704; cv=none; b=PptZm1SdOwwHqCIfCEGyb4yYv1Nat3R+z7Pg4Xt3CCOGK85N+pp8NJUvnpZdh+oXeHJoBmqHwouaVQhk984kfw8EZh4LaUMgCYA+Z2cpE/9oL3G5AytgO/lAnn/+bWq4fFKg8jIm6bIC1VC5IGCNEqNXQVkGemuwSiX/ndIsScI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787053704; c=relaxed/simple;
	bh=00JK8r+xOSOxAAFZmO92NvtQ9aCpSK3VHMbFQ6Xcwsc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eGB1tSZZIIzFW3t7S4UV1StzTrzBSR1rReSkz4/wSSn4fNzCZJRBPsberGt7tTFVi3xTVYycdHbU/jDX54VYPKWPb8lloQQjR0G0vUVN48auAFki3vuUS2svbAB3Bc8Rpra3XYDWYdhLHqcCLw9U/qFnb5eF8Iqy5hlYFuiUHcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=po1LRa6W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TJrx7RCH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="po1LRa6W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TJrx7RCH"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABU3F1021536
	for <phone-devel@vger.kernel.org>; Tue, 18 Aug 2026 11:48:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y6QFDJmo+aFscDi6EaPtAdK0x37xaU22YvjDJxvKySw=; b=po1LRa6W1GNsV/IX
	KLZRf6B9gMOmLluFVmuoYxPyKotJI22L0oEyz5Zcae2TJUhN0H9PJE9GPhRMYA+A
	a0qSLKOj74Qf1U2uLsM6DKPLOs8fhvI8kl43fBUynqwRRnQ5GCkxXG3570n10/9f
	vKUTU3dX8a79RHj5rnzfdh+4n8z1AHxRpuDGmZLzQmkZ6rWiJEUYpoykMMcAKR83
	meRtB7CpaiJ5IlfMHEnczAzsiGJS9pUtCj67IHM/K0/GLetcH+FZ36Ee8WEKwfdY
	COYJAR1y2udl6omEZ50MoxcD/xj5RXWvflNfPiukJXGfELXFaPD9qJPnjf95j5SW
	Hty6ow==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g48q0ugn6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 18 Aug 2026 11:48:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92eebb130dcso44557585a.1
        for <phone-devel@vger.kernel.org>; Tue, 18 Aug 2026 04:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787053701; x=1787658501; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y6QFDJmo+aFscDi6EaPtAdK0x37xaU22YvjDJxvKySw=;
        b=TJrx7RCHJ3QlZDCqpXwoOq40q8RdAQ22pKd7ZOtwooadvj5VgB4YvVawXmHsAXYIYc
         456LR+uXpjkhLwnlEjgcx8ZMdiz+olP3LNdr4+bDUlxKzMsd1tyu2c0exly290BXffjQ
         GoBNagWnFrDpwvsdwFABYOTgPremqW+apw16+Xu+eUf4mtAMePXzEsapCBdy+jrrEXf8
         aeLZKSO1HsMnGjF8g9VBRWkKc7xQUfHlaP6h2mOl4q4cY8xAk+CuSrXoSJpVLWjkm+FB
         hqfmFET4W1ltZE11dgaBvC474ANdD2Wkyxtw4v8Xfdd+S7vWFBh405NiVZmtlw63KXfd
         G72A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787053701; x=1787658501;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y6QFDJmo+aFscDi6EaPtAdK0x37xaU22YvjDJxvKySw=;
        b=h83Jtevmf/JeE1iLOH40Ab0wgzYLlndxfkau6qD6UPHKm85KQM8/lO0S3qDzw2uEXc
         MvBYpsbGf2C6iu+vLIQrLx3zT1Thqy3BiDAGxqvEBXoksBZioRyLRNbbQcoxloLC2qtu
         WhVLEy8joskuDUtMAVKFlX8czq4tof9BJT+ZbFayGBV1vNsJUCaldviK6PmpAQrFesSK
         gbGdF/YLz2obtQOuwY9zxnLjnsQ873cRD8C6MY46VIX4a9W66QTfJndLs80RnAEtrfhN
         AA28OdIUNZ7Ytv4oyMQvck+WP68OXV+fUHJ2M08Fb6MLjqEtRnwrZqxo23+W78hTW6Ya
         ZR2g==
X-Forwarded-Encrypted: i=1; AHgh+RrBaCjt712imXg6+7Aq/CSQCRDRX94QdfAk25+r4y5suxrRMPho8+df6JHfrn8V0jViXwPogSElo4aekQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMQbWBHgGYyVptvtwSVU8DQTlpO0yDF9wzhez41HvBUNlyKGfY
	xvNPn9NArY5gMcxiXBEc9TVJ4qmrgBvRxbMsaHb+a7jgLI1ZszpeIDJCRtOtekJ8mT6+HZlgL+D
	oV3zAOmRjvZBbsto5OmlZOBt5u68VZh7x2Se/od3W8P2lunzbkvJR42FXfdsPUt0mNQ==
X-Gm-Gg: AR+sD10HtHHgYB5ZN2GCsytEbJAjyeVaCNZOtUf14NFaCVj+tmOl5Rv6zqthsUOWRR1
	Uzplp0gsz4YIs6qphKbzCDHJ51eGuFb4JYPXAoLiS2IzvmL0/HPfW4fDCC5BPrU4yJPogxijBZs
	YfgbdbXFOlkHyfvMYLzoElsJZ9f8ZGIFYEpvG063YJ/zOd/qBNbsoXvJLs2axG1qYzUba7oI1kc
	5A5AOk0bT6vyj2xs0vJYzGHP+sGshU/oKwPkjJoxlXXW8RQMQHiUhAwVo4PzCMjq+w9ydIno/7c
	GZpyJ5XztccrYnujaJ3YmzBNUEle07Vd/MNIXp/aagYVvtGoJDLd9kH9ikwqpPtSCXYDz9mYuw5
	Qb+pc499e8fhOohIe9iC1RkLN
X-Received: by 2002:a05:620a:6008:b0:92e:6071:7cc4 with SMTP id af79cd13be357-936d23a402amr2233061985a.4.1787053701018;
        Tue, 18 Aug 2026 04:48:21 -0700 (PDT)
X-Received: by 2002:a05:620a:6008:b0:92e:6071:7cc4 with SMTP id af79cd13be357-936d23a402amr2233058885a.4.1787053700466;
        Tue, 18 Aug 2026 04:48:20 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c217fe6aa89sm173781266b.2.2026.08.18.04.48.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 04:48:19 -0700 (PDT)
Message-ID: <c556f7f5-a339-479f-af59-e5460606a7b6@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 13:48:17 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-lg: fix sdcard pinctrl nodes
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Anton Bambura <jenneron@protonmail.com>,
        Stefan Hansson <newbie13xd@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        David Heidelberg <david@ixit.cz>
References: <20260802-judyln-sdcard-fix-v1-1-b3477cfc42cc@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260802-judyln-sdcard-fix-v1-1-b3477cfc42cc@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA4NyBTYWx0ZWRfX3YEumZuvTxBa
 d7Lvg0eLYj24dE5FnThPmKiPy597y/T1yHN8Xr3HoyWjHvwSyyXT54GiPePAwaxBP7ogH9fU3Ad
 +ymQORNcd/rX63NDbWohoXlGXM4X5a8=
X-Authority-Analysis: v=2.4 cv=VuITxe2n c=1 sm=1 tr=0 ts=6a844685 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=OQN141zOAAAA:20 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8 a=4ygO6UpHBw7eDzxwrK4A:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=9vIz8raoGPyDa4jBFAYH:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: 2E_FKM4AwRoiQsE_MCEu42Pn3NGig4bp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA4NyBTYWx0ZWRfXyxUUvjG41YHE
 sGASDtl+eRcLMLV03r+15Q19wK9iz1Z1O7TpTnrB5XkLvMkd95hgGgg0fzzoYiXWlnBlmt/MTCF
 bgl94djna6nFfyC4T3rPGoKX8WmFzcKazXarUwEthqcmeHZnUxHCQLwnr0n0WEtHXArWI5O2n4h
 Jsbr0fXu4WLLo2GrT+PFuhNPDpKUR0nHdvi08ZeZ0CekYDfpkmsevPcxW6UliBp7gGS/fI1H0gx
 nakJbe6n4n2zjuZALNEn0wC1jCfbn0J0WmMG1lZDihm3KgmMId+ZY2c1IUvwpHuoEsOzQ3c/tIn
 5GW0OBmeY2I6CIESqDdMe4PVhPAnFsDTwd+fazYBYcfKcLj0OR7e0RyAqGleUa5WWZaT/f6L8bm
 f2CCUnZCLFiT+Z6UNDxi32aWB2G6P8w+K/Sii48UcEvWZJyPiAbE+s4lWigpcu880PbtfTKOleJ
 1U3puZqTdyU9wLtfK/w==
X-Proofpoint-ORIG-GUID: 2E_FKM4AwRoiQsE_MCEu42Pn3NGig4bp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180087

On 8/2/26 9:06 PM, Paul Sajna wrote:
> sdcard was previously rather unreliable during boot on sdm845-lg-judyln
> 
> Identified and applied correct settings from downstream lineageos kernel.
> 
> Verified card was properly detected over 5 reboots with rootfs on sdcard.
> 
> Refer to downstream: https://github.com/LineageOS/android_kernel_lge_sdm845/blob/efa8458f79dffeb380d43b38b9403407f87d9f05/arch/arm64/boot/dts/qcom/sdm845-pinctrl.dtsi#L148-L303
> 
> Fixes: 28ae8aa3923c ("arm64: dts: qcom: add device tree for LG G7 and LG V35")
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

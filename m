Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770670;
	b=J3XCCBVSfXWZcRkMEWo1Otazdzwf5OLJxVinJEphWfwcV6XR5taM1yraBypTmDTwVsG8
	 X99aOUxOU7nGA8C+jbsmZsRIguAnaB6YzqPxllETe4IxnEGA5o2ODgERebvtL618MncPI
	 947se1Aywcsa8QXsuXee586l5ywiVGxeJd94A2shmZxykGtLdSP9JOUXM1qHju70461do
	 ZBq0rRH7qe0aVOYd5TSe1t4PZw3Rk3SDVzyTQBEc403TF8e1Qqq0EPrY/7/eNZaYnksDn
	 /+J96WunkJR0reeUiTNHUEds7dK/KXikUvBCqbQZuGsuHokEIyJZrnzbjfxQLlBi0Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770670;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IgUsGcjyfX3pn/47na2rOFgHRHCfaEjUCpn+6VJ9aDM=;
	b=Y5WB5aKRE8UMFUBBN6afBZLhGGo2tRg/eCPB3RuvtPRcPWhSONuXqidsAF3Yv0r7Nh7p
	 HqZf1vuld5ZmThp9BQdL0D/5ypyzZufsp1giqQh3/CTzGeZQcnOz3pTiuj65hWTddi3LP
	 sWIBVUjP8uSc6ewELrdsuG+Kn7Vmam83364Ur4xVWJ0FO8XjtrL8z/EFNBUFvjbSYmpAa
	 vRlMNIMS8FARj56R5lgZTiiyY5dzZlI2dlTihvQtPfR5zFLM28tdBBHqNsizQsqfOqx1l
	 zOa39gsfB00sQe8r4TFhCbn/4znDO16TuKeGyzkdyBchTgJGNeNe7/ljj2OegIWW/Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xj3Z3Cob;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="U9hc3B/j";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D419606A323
	for <phone-devel@vger.kernel.org>; Fri, 27 Nov 2026 09:11:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D419606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xj3Z3Cob;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U9hc3B/j
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GIUT1779838
	for <phone-devel@vger.kernel.org>; Fri, 27 Nov 2026 09:11:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IgUsGcjyfX3pn/47na2rOFgHRHCfaEjUCpn+6VJ9aDM=; b=Xj3Z3CobRIVJY8WD
	UnqJ/SMwLSCDazOFshwsUrN0xRwkHhr/r4mDo3e7WQJJDpap8dala8XgfPLQcu4l
	7JveU0dyBEKXzdu20o/kTIBkkMTpVKEVif1pQOP6EimGKAd+9HhXbAsKKw+reOm9
	QYzVXhA+WGtmpv4M+pZnkfyFMJHKUaix8RktRRjjk3YsdINu7rF1/yeI21Xa2GGe
	isBrxxB51PZ3014BEUdRdaGRn/SpLuim55rihyMQUZFATtQQtsJFmXWr/Rqu/EH2
	7aw1jPQn2yxIl4pA6sZFmEfIvfjMv1OlVf997L7NZZrCRvgAS6b58ls4fu3t4tzP
	lkgx7g==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73uhgu2n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 27 Nov 2026 09:11:09 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eaab6f56c7so405122e0c.1
        for <phone-devel@vger.kernel.org>; Fri, 27 Nov 2026 01:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795770668; x=1796375468; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IgUsGcjyfX3pn/47na2rOFgHRHCfaEjUCpn+6VJ9aDM=;
        b=U9hc3B/jq6cSUfq2g6GMrZjaQF8x99qU7tOwkAT2xSbr72byJ/w0GR3fsviDbQ3qKm
         wP96mRwfmYdM0RDJHPHxkCvwLwCD+zJ+p6FgTTY54YCCw3AaKBbvZ8iyOB/Y+pJp4ar2
         /EsimNX4DZMPBpGwmE49BjGpUdB6u/sE0mXHFfx5RcP0PXycLeL9gYbwwsuRUo2MOzFk
         xMZCFQHBsOYik26OTevns1hbwKuiwkjAZoVZRCfLCZAzWP+rWxuG5x9s8xGAgouBB/2x
         /H/vBFa4fsarVUC1bXAxgqx5caLvVEepu6uRHC6icMTTD6gEyrr6FX3sA2NNPCLUhO5Z
         h9Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770668; x=1796375468;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IgUsGcjyfX3pn/47na2rOFgHRHCfaEjUCpn+6VJ9aDM=;
        b=SDlTe574gWMb4lQy45XVc0TyJ6ek5cSMpkNbtcHgN7QfdhlDHJUr0AB2cdSdwOQxPG
         aDMnvgUm2xLV6Rp5FR+pVpNEGxQunYXeW7anR+F5QvZ9dvNeBYhoy9xgUMjHJhKq39Bh
         2G2H1TiP328kQ5ecvW14SeeOdQkZMXL20ujwseaxPmsOrlULC4Nhb2/mjobsQ11Ni0uf
         ZrRIhWXTlws81lOS9VYLu3hjZjPx6kGh99FsxHw7G6D85ZiS5CA00dgn8AP6dDlgnBS/
         /rwI5GbrSpb5MP9HjAFSU4Aor0CZxujfzGMgj63EtFqCweH19dK5oS22/0Bx9bSlwQR5
         sSeA==
X-Forwarded-Encrypted: i=1; AL+hErHu9rRE91HIORgPUTqEKckqkafdKTwi6ZxhC+2eqe0FC42tixmwz/3CW3HraVsugmgULLKhkdzpLq88Iw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9DCRpJby+OplfwRngXIhj3JhoYeJWVcC8gaHW88fXyAfHjDXqc
	5+6DYpbsEIJeRkEfcIc+Fn67HMuTQ7r6uABk5PlTeQSWjtPhOpatPpsqFYIwova3yr21rQCtqNV
	lOIUOpRZJ244XjL+OGhBpjMdyPHGekoHgeZ8sSPiH4JnZFf1/wWs3GK+14ylUwOgw6A==
X-Gm-Gg: AZFdTZehbzUovqhRcFye7lZRQrYO5tDmAlE9sZO5ne9Dg1oNT6HceLXnCiCIkyRy/e0
	xsRXj00hcBh5LMOBDHbtg/e/4s8We3Zdg+ZIU0qV92qc5BYBPmIQgC7jut28Mn2ki0zkGxvnPLQ
	cSFBw5zlUbr+PnVtqb0rKl60YW/DUpgIlDI09NK9dtZqwj7HdHtPzmrQaDlob0XGBmxFSYi/IAC
	1BQOISPkH0YkqEsIOzFkIlj2tkyc1z29cZAL6C9c+AdH0kf/EwSU0dKvsxNrIVyaOQwHZPbbDb8
	xT4deIjfZ6bfbqsSJh8LtK+EWeQBn1YqrZWyKAXdhFv6YofulmZdhqJWLEZSMg01w0J+hR6kwIx
	JirjJsCyIO/g8U/yMimgFZAAzNn23Ry5gTI8g6JzEWGdY0rhDwVoeY/4AYVcMxOBh8BVgysw=
X-Received: by 2002:a05:6122:4a01:10b0:5ef:d97b:2867 with SMTP id 71dfb90a1353d-5efd97b3b39mr322611e0c.0.1795770668623;
        Fri, 27 Nov 2026 01:11:08 -0800 (PST)
X-Received: by 2002:a05:6122:4a01:10b0:5ef:d97b:2867 with SMTP id 71dfb90a1353d-5efd97b3b39mr322603e0c.0.1795770668162;
        Fri, 27 Nov 2026 01:11:08 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b03723bsm840417766b.87.2026.11.27.01.11.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:11:07 -0800 (PST)
Message-ID: <4aa25716-37ab-43ba-b3d1-b0b48671dfc5@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 10:11:04 +0100
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] pinctrl: qcom: Add Molokai TLMM driver
To: venkat.yadlapati@yahoo.com, Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20261126-molokai-tlmm-v5-0-ada44435bdd3@yahoo.com>
 <20261126-molokai-tlmm-v5-2-ada44435bdd3@yahoo.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261126-molokai-tlmm-v5-2-ada44435bdd3@yahoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNiBTYWx0ZWRfX72m97FcOWYo6
 g1zFp7olEA0Cwe7RZbkRyu8nAFsHwZLKkRo4O6UoG+9rlRO0f4NtHLq/Ps/S3e5+4ogflIfJAuw
 uX4Nl0rLlyd6GMqDqFdGCLuSovYBgM0=
X-Proofpoint-ORIG-GUID: 2zw3KUKBuYOLCYSFyjehf7XEgq3wsft_
X-Proofpoint-GUID: 2zw3KUKBuYOLCYSFyjehf7XEgq3wsft_
X-Authority-Analysis: v=2.4 cv=BbBNQbt2 c=1 sm=1 tr=0 ts=6b09492d cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=CjxXgO3LAAAA:8 a=EUspDBNiAAAA:8 a=tfEBk67aE7w0iaTIDxoA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNiBTYWx0ZWRfXzVjlvT2bPv0Y
 X/NLFVjY5wmzPeGTLkUQlV1yGIDrao5vJz8byTeXK3Y8ACsYtIRMlzO8vcKNt+nO8SUP/10IyFT
 LHt3ZdVSFZk1hieFTZqQIWrX7O94QZZCLcHyk2pY6EF32IeKktspXnyrFF3501+D02LBR0UBQg7
 BnS+XM7MS2ydRyIX9gZbrbeXnsx/jNrGOIQG1x78xgXwSFAs8O/wUYDuPXvtXYcNTybV1lx75tx
 4UbXFaYa1duSIrXVIHjlciZSeN/LAb3EgPxwvE1AXtlrwtvt3rK8c8wc2Kafl2zmqEmeLOyXdy+
 bGU9uytwxkEdpu9jDwMOYXHjWc7NT5wPqsGSpG+lH4zmPqmBcOqugTJtP2fzIKD7PoZ82kvQjo8
 HLLOQ+s5OEVq11VtEDpG7ph8iXACTREa2GbclU91KGyeu+7p1fpxHHkcP+wdAVniOoPzdlBg2kh
 W3TFlRBB5V9vGh2wo0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270036

On 11/26/26 5:51 PM, Venkat Yadlapati via B4 Relay wrote:
> From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
> 
> Add the pin controller driver for the TLMM block of the Qualcomm Molokai
> (SM8845) SoC.
> 
> The register layout is the one of Kaanapali, but only 29 of the 205 pins
> have the Kaanapali pin functions and the GPIO to PDC wakeup interrupt map
> has no entry in common with Kaanapali, so the Kaanapali driver cannot be
> reused: with its tables, a wake-capable GPIO interrupt on Molokai is
> routed to the wrong PDC input and never fires.
> 
> Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF79D28DEE1
	for <phone-devel@vger.kernel.org>; Mon, 28 Apr 2025 17:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745861997; cv=none; b=d+mehIL1wek7OodshNclSgdRu0DUMNtdCe1IrwQsobYGuqgQeU7VZL7GqC2YqgZzD/V9+ltWTrGKvrUFcaWnY2co7W0VugH+YrJOEt1uow162Dllvs4OzRB8Ux8Rqj6Lu5maHw8+KGHLi4A5/In1J2Ij37OnjahXFwyzVZGZHLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745861997; c=relaxed/simple;
	bh=TNNGtQDx5v0lSUvL5LAXsIqIpx1Alm5Z/0INHcrVzTw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ic6jHEmoCZzFDswBxSBeGtzeKgWbMbYHwT7Rok63vW7rrbgtfa5E6JY0oXnlQattwfLp0GgHJMqahhbUfOVZ8GSe0/Qez1e9u5O3/IRB5Fn8aYEcqOj9UkccOrVU0JFHki+asdGcwVuzQa8n5VZG1bpC3cW8iD46U2P6c6l8AYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cHKNClpS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cHKNClpS"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SADFJO002817
	for <phone-devel@vger.kernel.org>; Mon, 28 Apr 2025 17:39:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kJa9nriNSbV6GulDGWzrZjMucxKix0H2ciE1PDj/NiQ=; b=cHKNClpS6Ur/1x8j
	SxGyGtbu9piRQ25uf99Ue9UOPE6mEV/rdqICRYdIu7R2GkT9SfNWmAr7jkbmLCfj
	ITwYcD64PG0WHVlfWeggx0Ow1UcpVIQ8WIP/FdzPg5xXwi0JtH+7ZMRxC48148fd
	ZNPkm5NK6CjA6+OhDNfqz7Sjm1EtIKaVso+CmK3dZ8by3nqAb37DTMFWExQBrt0s
	wv2syQsnsxcPc1ek/J3O0Ki3w9LCUWBQV6Drnck9OjnS/281fFe4Lm6CHo1aUuyD
	TN4PCo5wkdulhQt+AEZGCjY+NX7lyq3OIIr2b6fwts5OSDQTmhTLBdLu79VCH9rG
	n8+Kyw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qv9hwnk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 28 Apr 2025 17:39:54 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-227ea16b03dso75557695ad.3
        for <phone-devel@vger.kernel.org>; Mon, 28 Apr 2025 10:39:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745861993; x=1746466793;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kJa9nriNSbV6GulDGWzrZjMucxKix0H2ciE1PDj/NiQ=;
        b=LnRwBrHV4lII8TUV0f9C+JylAdo9Mbl8f8oxGqucqPDKPoysn5YciGH6zieJTRgbXk
         /bckZJ0t9JoH5qasc7PSzVqdHS1W8SlE80F42RQb/E+iTbRRP55rnuGGzlXEJXHlMv4F
         Um6buvhDUUoDlrNl0OJq3j0d4Cv2xMgfj6QwvKl/OkrDzn2K8CJMz5QkUj3qebjgEzeU
         Kub3Q5BJK/B4AM1sydi2A/j2hEuh5F1OGRMjfjlRRYW2iDUfEW7E4svZ+Da2imfexq54
         9kW779LSJgtCiwdMMmCMfEWaC3E1nKkDGpRSU7eUDtewlJzyH/6WUeInbhiWUp8c9T2s
         LuNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXGoYn1Yv6yimuw4gsYpxq3q3qtRnbMPbF7Mm7LKfqyBRpjGJ6c2I/+ad+gwYNmcha4Mafk7NT0HS3uw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVG0La/ZArbjFM85NEpGLlhbw3Y44fLhZ0TRaulknwW4zSMlB4
	Wgsqfx9lAUn42TXjtgCBvngb2Hw3FRaTc4S6+jWlF9yqy5EyRIB56bpt7rjmE0j9mUDp3nHUUPw
	d1Gkk7lNINPbPorunTHuonoStK3J7w6G/fK25Nhz6WNEOG33QmhATLFH7U+smDw==
X-Gm-Gg: ASbGncs00AFzX3vrNrsTA6Bm3vqqf3XhbuxQHwsDIxtmI/ON/GVxzdD/OYoXixUhjI6
	M0YZ1F1C0/Aq1aZjyI0QAUYlksicDi3QRaqGRDemvKhxCuSHXwbcHXb1Jf76EIKs3hJ181SqMBl
	0Z4QhQrirKGandoX481joXPgvls3zp4xPNVcyF+P5Ni8GEkxijmGMVyplQRzdS88KHkidd4wQjv
	Vj6B/p7gAlDvEq3wKX7mslWCUykWa0g6FVb6SNpAN4s+4gdR38r+wOEj0eGY3mb0E4e2TN8hHJx
	jfCQty2BncjHX4ppI00WlE8oZ5VEgCTqJ1lrtNaw
X-Received: by 2002:a17:903:2ac6:b0:223:f408:c3e2 with SMTP id d9443c01a7336-22dc6a044bbmr161718915ad.14.1745861993037;
        Mon, 28 Apr 2025 10:39:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvlskYHOZiBCeXgC0mTr4QOcNigVP0wPNkkgoEFVQfOBxIYYrNWAPwXjaX7+uhjv0Xwvq9gA==
X-Received: by 2002:a17:903:2ac6:b0:223:f408:c3e2 with SMTP id d9443c01a7336-22dc6a044bbmr161718575ad.14.1745861992644;
        Mon, 28 Apr 2025 10:39:52 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.26.142])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5221c60sm85923865ad.228.2025.04.28.10.39.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 10:39:52 -0700 (PDT)
Message-ID: <aab5926f-6ae4-48da-a15e-0895cb1bd987@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 23:09:47 +0530
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] clk: qcom: gcc-sm6350: Add *_wait_val values for
 GDSCs
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250425-sm6350-gdsc-val-v1-0-1f252d9c5e4e@fairphone.com>
 <20250425-sm6350-gdsc-val-v1-3-1f252d9c5e4e@fairphone.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20250425-sm6350-gdsc-val-v1-3-1f252d9c5e4e@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AO34vM+d c=1 sm=1 tr=0 ts=680fbd6a cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=Svr01UFivMFfsnZ9dZkWgg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=COk6AnOGAAAA:8 a=dAfvMG2scAZbeIDQYVYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=Soq9LBFxuPC4vsCAQt-j:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: oXN8XaFKUc5OAstxfNL9-3mLACv3El_s
X-Proofpoint-ORIG-GUID: oXN8XaFKUc5OAstxfNL9-3mLACv3El_s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDE0MiBTYWx0ZWRfX9MPpSazKRUny Coo6bCAlG9/7ATrsuZ6QmTW4p2JPajKQZOCjNrhU8E9d0Hy0E/qzI0ifvsZ6jR4Um8t7lWAM+pl m+hcILi28+0m5S0ss6gqIfN9gNqjfQ7OlQUsJ+sc5H1aP/++c57cmgNDPs+xBDb6CNsVCmTZ5TH
 ZVZ9zBdJr/eK1jwKxpYgdhL+uEhnsynCUQ1675jEfjm/8OKnAgJy7Cgczxb95I7nANWY60qF14v 0Qv/xtk4KUj87bN3xmF/5HtIWuamtDs8pQGNpkxVNxR/nYPLbGrb5lBi7YFx1Zv+PcN3/MNjrL9 dcfqXEoAQNb9p9nvSAaGplogpjnEPbIifsW2/fSzmGt/1yySURS/T0MGKavhETp4v+J2WV7coNK
 DEEeRPJNVrjcxn+keQN+Ng+U2EfisTueNDgKuWmeKVaji5F/PS0chgMuSep0OeVil7YtzKp1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_07,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 clxscore=1011 malwarescore=0 spamscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280142



On 4/25/2025 5:42 PM, Luca Weiss wrote:
> Compared to the msm-4.19 driver the mainline GDSC driver always sets the
> bits for en_rest, en_few & clk_dis, and if those values are not set
> per-GDSC in the respective driver then the default value from the GDSC
> driver is used. The downstream driver only conditionally sets
> clk_dis_wait_val if qcom,clk-dis-wait-val is given in devicetree.
> 
> Correct this situation by explicitly setting those values. For all GDSCs
> the reset value of those bits are used.
> 
> Fixes: 131abae905df ("clk: qcom: Add SM6350 GCC driver")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/clk/qcom/gcc-sm6350.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gcc-sm6350.c b/drivers/clk/qcom/gcc-sm6350.c
> index 74346dc026068a224e173fdc0472fbaf878052c4..a4d6dff9d0f7f1216c778165a1fe9604d9ae41dc 100644
> --- a/drivers/clk/qcom/gcc-sm6350.c
> +++ b/drivers/clk/qcom/gcc-sm6350.c
> @@ -2320,6 +2320,9 @@ static struct clk_branch gcc_video_xo_clk = {
>  
>  static struct gdsc usb30_prim_gdsc = {
>  	.gdscr = 0x1a004,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0xf,
>  	.pd = {
>  		.name = "usb30_prim_gdsc",
>  	},
> @@ -2328,6 +2331,9 @@ static struct gdsc usb30_prim_gdsc = {
>  
>  static struct gdsc ufs_phy_gdsc = {
>  	.gdscr = 0x3a004,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0xf,
>  	.pd = {
>  		.name = "ufs_phy_gdsc",
>  	},
> 

Reviewed-by: Taniya Das <quic_tdas@quicinc.com>

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9694827978B
	for <phone-devel@vger.kernel.org>; Mon, 28 Apr 2025 17:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745861883; cv=none; b=hJOlAGqahOm5ZGfS7FJfDGsgG1uOC1z8vOh18YYzVRc5SDhkXFXZYOsJl54IBsFkVS3MYHrTCqonZN8u5+nJzc3m5J6L+hRYh9ny/LBRLTRFqVUjviCWaX9HX8gQ5spQ+ecwlvGSmTb6r2zySmze25hNO2c/CDzkHpggXVF5Yms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745861883; c=relaxed/simple;
	bh=Ew+kA3LphKC/N1vEi8EfSsJC6NyDfoTxzxJDRuUttNo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L+X1WtKnji/mVLAJ1w44wTEP69nJEvcmt3jyd5f8cJ6H2Jm4wnS+o260Kf7zIc5hbL8DwD7uQcdf7Qnq8NzqKcIJe7iWh8YlsEVmAS3PXF5+aeqOE6ehYmNopJkYmgGUHLHTGwi3bJpB/MyBZ/rsdHraYO4LpocV/TvWCKnxmsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YZHblShb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YZHblShb"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SAA2Ov004294
	for <phone-devel@vger.kernel.org>; Mon, 28 Apr 2025 17:38:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E06lZm8/a8C+GSuWM+FihQN59u7SXIBJ85yum5YDOXE=; b=YZHblShbGYNTrSv7
	6l8YuDnhk4kwHicWcZNLHZFiMjFqQQ71yeNxMBu7tCj2IvntGthvSSl2QWQrhSbA
	flD3zLQLqBJ5zb6dnffUEtqiIMcNiZ1wAmmt9v6RsmXgvF+tvF+mICvSMaz8PYlE
	i9Rm3NO/eXGyu68cbWI5aNXuH2kd5PJKtjjpYmRKxUbdrQqrjPl1g6Z/Fxl9S6SF
	61DreWw84ULgf3sseE6SBDot1IpuxbqJF099bnvgKmBqQj62hl9UUArhdH0SdKKu
	1A51uI9iCm+mwQmddORI7tyqTMw0HRJSwk+MToP12pM3PNNnPVvYgUR99eWBcajN
	VXwkSA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468muqj4f1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 28 Apr 2025 17:38:00 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-22aa75e6653so42228775ad.0
        for <phone-devel@vger.kernel.org>; Mon, 28 Apr 2025 10:38:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745861879; x=1746466679;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E06lZm8/a8C+GSuWM+FihQN59u7SXIBJ85yum5YDOXE=;
        b=TXqhcYlgoxeLs92J++aoHCmDTyApwuGzosXYkDHTZqWOHLtUHRaeNiJoigH6oSUMGk
         R3jUfGDazKyoNd5pCOnLtUrQ5f60HOoQt0h0afxWK0EwqZIUpZYUXPtQmIO0CBuEQQ76
         MQeURRqmY9FosRfHZq3R6iTE0NC0h7HDV2PgaXYZ1xIDyq9d8MzDuh5bzjk70IcR0pSk
         NfmYzN23UGa1GkfKH424kUuYcU7dj/6YRm4TF/dneXL4D7pcGI/Wbeim2bY5N6sJtWpw
         WsXbsii3tNazShaPucnDJKp6mH2Dyajbm00NVyKXdydmP2jXvOh7xdCSK0U6bYzfQ3be
         bOpA==
X-Forwarded-Encrypted: i=1; AJvYcCVnEInCH+BC5TfvmMxWclnXzgpcHkIRSCjdJmBerR3HEBqEJfsWrZyCxUZK4iQWOYOw85znD23k/x6x+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyC85Fp57E6VTrGOqWy0XFMU7unrLjybEFiGxpPXggnnsQCkuhg
	6UC9DQJzqRj6EG41r89WmZqMPvIS+4C8uRK4SlasYrF3mDmSOOkLBLq6231jqhkYJ1idTETvJhA
	iqWSUyL/6Sk1NWtbezr8PpWiS2yyIP6LlBlpZEJEJPUojYPU4SYr0W+PWETg0IA==
X-Gm-Gg: ASbGncv0YJWlt9TMwepMoPB0BYuD2KS35k2oMFkIM7FJYGOY3IJNG+kToFm/RMfkoWB
	Fi86TuQJsrZiLTK8Dpq1S2A0PSzPlKC2iHw3z1IiXinQffRxgcJVM7hoG7CSOYbSsPYy45+s3Ju
	dKpLudzlsrLU8C5W5pfsSmJ3ETp5yhfTVUx9D6n7pyKre8UV348dvxd1mViPpO3Mm0EnM9umuZw
	68V5paEESZe3V7LKa5akZqyL5zPpWIYuPjJwzN1cDC7sRKONqniRcaBibGZqZTRaHeFIoriTvfY
	JT8zo3rHBwnbsnwoQcEJ787pcudl1vsa2A00aIg8
X-Received: by 2002:a17:903:1c4:b0:224:1ec0:8a16 with SMTP id d9443c01a7336-22de5fcef8bmr7664615ad.21.1745861878914;
        Mon, 28 Apr 2025 10:37:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQewCtmbo+z3XRi/CjK7rhBqdRvOkkoHW1zLJauNJXjHGgMmJZLsG1arrVNEyzH9XB33aKDA==
X-Received: by 2002:a17:903:1c4:b0:224:1ec0:8a16 with SMTP id d9443c01a7336-22de5fcef8bmr7664265ad.21.1745861878553;
        Mon, 28 Apr 2025 10:37:58 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.26.142])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbe4desm86011245ad.70.2025.04.28.10.37.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 10:37:58 -0700 (PDT)
Message-ID: <2d85a2c0-8084-4bd3-b5f9-e7dfa8303b65@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 23:07:53 +0530
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] clk: qcom: camcc-sm6350: Add *_wait_val values for
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
 <20250425-sm6350-gdsc-val-v1-1-1f252d9c5e4e@fairphone.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20250425-sm6350-gdsc-val-v1-1-1f252d9c5e4e@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDE0MiBTYWx0ZWRfX3JAqhvbF5QTr QxiwR3u1qPsZLa3ZuPlfOGerBjDHq4TlwYYxmpicILsfecpLsLncP8ML6pbrG3ceUwzTYESCkZI yTIzJfojqLAJ2Ib6CWVX8Pevr+ujjysD/VosZJmJIE/CYAdiqYOKjXiDah0DgzZpQ8SGxxFmTR/
 dAUApHDcJcIsF+x8R7iaKvyjrUH1GrELDsRtn7OJQSvFikgquL9byhA5EUJ7iYTiBjUO3x7ARA5 Dt9skq5OWJppfxHD88QJMm9yosVgPns4CAKL4pcDZ/hri865aRss703N1+nQATiNbku/7f4DXaD 61ZxU2ljNHEPEwkpB6DMZ4c8twLCtT6vDrzbpVL9cTxks0w7iw86O/a8vUYpK3AWnhajPBL7dcl
 +7LxCMSn34/p2KjdvT3XBl4r9vcBMo4S2txxZ7tQDjzmqL/ToqbFkU2ehsiTm8Q1RYxnSlRB
X-Proofpoint-GUID: C8crwtpIYzqUeI99Cb0n4vLOEHOZg8ZW
X-Proofpoint-ORIG-GUID: C8crwtpIYzqUeI99Cb0n4vLOEHOZg8ZW
X-Authority-Analysis: v=2.4 cv=M/5NKzws c=1 sm=1 tr=0 ts=680fbcf8 cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=Svr01UFivMFfsnZ9dZkWgg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=COk6AnOGAAAA:8 a=fdW-LsI-krylFDxKIpoA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=Soq9LBFxuPC4vsCAQt-j:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_07,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1011 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
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
> Fixes: 80f5451d9a7c ("clk: qcom: Add camera clock controller driver for SM6350")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/clk/qcom/camcc-sm6350.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/clk/qcom/camcc-sm6350.c b/drivers/clk/qcom/camcc-sm6350.c
> index 1871970fb046d7ad6f5b6bfcce9f8ae10b3f2e93..8aac97d29ce3ff0d12e7d09fe65fd51a5cb43c87 100644
> --- a/drivers/clk/qcom/camcc-sm6350.c
> +++ b/drivers/clk/qcom/camcc-sm6350.c
> @@ -1695,6 +1695,9 @@ static struct clk_branch camcc_sys_tmr_clk = {
>  
>  static struct gdsc bps_gdsc = {
>  	.gdscr = 0x6004,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0xf,
>  	.pd = {
>  		.name = "bps_gdsc",
>  	},
> @@ -1704,6 +1707,9 @@ static struct gdsc bps_gdsc = {
>  
>  static struct gdsc ipe_0_gdsc = {
>  	.gdscr = 0x7004,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0xf,
>  	.pd = {
>  		.name = "ipe_0_gdsc",
>  	},
> @@ -1713,6 +1719,9 @@ static struct gdsc ipe_0_gdsc = {
>  
>  static struct gdsc ife_0_gdsc = {
>  	.gdscr = 0x9004,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0xf,
>  	.pd = {
>  		.name = "ife_0_gdsc",
>  	},
> @@ -1721,6 +1730,9 @@ static struct gdsc ife_0_gdsc = {
>  
>  static struct gdsc ife_1_gdsc = {
>  	.gdscr = 0xa004,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0xf,
>  	.pd = {
>  		.name = "ife_1_gdsc",
>  	},
> @@ -1729,6 +1741,9 @@ static struct gdsc ife_1_gdsc = {
>  
>  static struct gdsc ife_2_gdsc = {
>  	.gdscr = 0xb004,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0xf,
>  	.pd = {
>  		.name = "ife_2_gdsc",
>  	},
> @@ -1737,6 +1752,9 @@ static struct gdsc ife_2_gdsc = {
>  
>  static struct gdsc titan_top_gdsc = {
>  	.gdscr = 0x14004,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0xf,
>  	.pd = {
>  		.name = "titan_top_gdsc",
>  	},
> 

Reviewed-by: Taniya Das <quic_tdas@quicinc.com>

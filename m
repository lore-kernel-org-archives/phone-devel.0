Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA938302CD5
	for <phone-devel@vger.kernel.org>; Tue, 10 Mar 2026 15:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773155708; cv=none; b=PDMCfBUTZwpOj5l4daxWLasdXGsZMXZOdEoSGITkFEZYzOSjujdJ5WmEWL/krWmB3GkiEqlpmKuyaXCh0+49qAsFlhGDjNXWCUuZTZn12/QjHpNxUrFfEHXSG81Ha7ExBmdvcJVN7vzeStnkQzvP+xEk3lq/g9QabmFlW9hb4n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773155708; c=relaxed/simple;
	bh=iJPpbCUuH2sGN/CUPHikiKBsufc8KSyNz/2Wrq9OROE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MPXPzanVPas9dQUqwJlYycu43F0FUM37uwKAuwfAaFtbMQC7N9NZEfyylIW2z4FXtZN3M6T6/e0ZlEXSYxcBbtkDxpJbItxjZh5OEBYjB+Q8RcrUV2hSpAuSZF0B+0tO3DsqiKQ48xs6Z7PekxeNkCZd2ZSrOqI7MB6byymTaa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gb/szAsz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g4NMiZie; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gb/szAsz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g4NMiZie"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACaZBf3771974
	for <phone-devel@vger.kernel.org>; Tue, 10 Mar 2026 15:15:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ybpgTASpnEgpi460upjKC7VKszciXje9SlVqYxlJU5g=; b=Gb/szAszl2jQJtr1
	+WVtqC2SoYjflCsQM4qIad212P7nAGI5nU8rykCVeqxxv5eEkmJM+0c53x2wUo4h
	9PXlyVJtWfIzJQicftT/q8XSctgL7fFUFBE2ymkJ50sXQuK4ea36swikGktjsdDp
	XQomHLF33det+PQS2Tx3s3eVnDVnBiZutFJ+7/T/fsAYQ58rEGCWKwh/l0wm80s3
	4Raz97n+0IrfqMUftlmifyI9fT6y54gl+zdKZfK78QEHLYcmCrEv29OLUJYb1PsQ
	1zI+uQexaI8TrKwEu4RxUVZ3jaUHKlx5Xy7aiX6OZvgNvZ2mZnnOis6IhX4n6pFU
	Zgcshg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctfcj1nmk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 10 Mar 2026 15:15:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd8198fe16so188497885a.2
        for <phone-devel@vger.kernel.org>; Tue, 10 Mar 2026 08:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773155704; x=1773760504; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ybpgTASpnEgpi460upjKC7VKszciXje9SlVqYxlJU5g=;
        b=g4NMiZievGxAnDOIfzkKuNL+LFBHSkQc491MgKyRsMDwh3YcRw+zH1YXXnlS02+NEv
         RBgZL/IvJ4JT8YXk1NqAIipnXe78BsIyO676KtIu9wIvesMLrCoiOHbO10/CECCTL/VR
         mC57fgKyWND/LcaVXWjJ4ZQEMCas8QdpLJCVie2kWhEYohBRHV/z3fo+uJA7822kacqz
         /5L0wjr2TxKgy1zr/UpPeAreMJ5WBxt2+gW6AB1tL4xaQHjp4FbTVyE/5+ujlGQ22h4Y
         2vhyErF4HHeemlnch9eItjLOkz1KF9LCWvWTVQ8N53VqyV42jFfbXxL3kys1QFWDrq/+
         XG0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773155704; x=1773760504;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ybpgTASpnEgpi460upjKC7VKszciXje9SlVqYxlJU5g=;
        b=ntIuqMPsAVqBKYgKdastS/umI/A1FcjX31MVZfnNFLAeOnMYUmalMiZ6vI3C+Sck5Z
         Xig3uQ0xlGIy0+bCmyfx0P3gShmSCkp/MHTGMR4Bi2T+qdhKUw6ZhuI5L6HgEiJ4QhMs
         SPEsGJwIZNtxGw2D3wFuVedHeRpOn5QWnL7Stketo4K1AJ5L2FApyT6ifoL6UepIAWec
         kcMgAzON1ouOXQIdP3BgXStg8T7bjWlrPVHk3L/iWvoP/DO5aLJ0XAWQJfO+2RrxsibL
         aXfQuzub+cWo74yjAC3IXB9owIrU65Jd6g8lpN9gCc9jEcWnAFHS99uA8YJ/LPLsIKa3
         dyag==
X-Forwarded-Encrypted: i=1; AJvYcCVtph497apd6v7fXVghYIYFi1ZoYfKB/YI8tdujlycrquIj7jbHGTgYofqmxeq66gyhY7ktAhBj215t1g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn4far4usTePa+Rb2seiTJdHjrQlA+UEyeNagqcqAKRRL8/El0
	ggUqr86ULhhXpYX7LAtWTdWS2zdnaqhVeL7AL3PvipNokzcYDXbuUO76MkzCCCfIhA7iXku2skK
	z3jg6U/fWaf+3vl+gMS+n7AKurWswXYIlJhHvmfCk/gUmNN+ikt1f9tYCKyT+bdeEwQ==
X-Gm-Gg: ATEYQzxSYZEkf9aGbESrMEnEj1c2hYXa19A61i+UtpBl2juhqMJydkUEnWJuEAw8Xek
	kfOxgUOb3HyRkg84iFuvZeSkepRghSy3swR7OJpq9YNui54KPvEQsKme722uIhnE1oeTq/x6b+f
	ctgSA0yZ+dBQ0dzZ9nnANMEZBgFVA6rZnhCS7xLVEzJHvBFD7v/+Q1CtAEByvoLLeka6aFxqSHC
	t7xG8dH44h/rI9kPsvSRjnEw7Vdon9jSQKxlZ8SSuUs6/jQ3hzDwbOBjph2IfNkXgAPohL5VX4w
	Q2WVF1eqlIOgHY5DYCQill9XjCWrSMRWwZcLv27FMnnzesnfbkt+rZ3QhApqd43BzbXl8m2CS88
	gFqvQf3PcCuZO4ATLh6sReUHiUyGTHrteh3Iqp941dKcVF6RKGcTEQziZcoLgzGQ4zlUsXi8STk
	2mBpE=
X-Received: by 2002:a05:620a:2955:b0:8cd:8411:a5cb with SMTP id af79cd13be357-8cd8411a9c3mr842051785a.3.1773155703946;
        Tue, 10 Mar 2026 08:15:03 -0700 (PDT)
X-Received: by 2002:a05:620a:2955:b0:8cd:8411:a5cb with SMTP id af79cd13be357-8cd8411a9c3mr842047085a.3.1773155703433;
        Tue, 10 Mar 2026 08:15:03 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942ef48267sm494734566b.3.2026.03.10.08.15.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 08:15:02 -0700 (PDT)
Message-ID: <1df08447-0ace-4771-bc1c-b0f8c5d0f9b2@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 16:15:00 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] clk: qcom: Add Global Clock controller (GCC) driver
 for Fillmore
To: Aelin Reidel <aelin@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux@mainlining.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20260308-fillmore-clks-v1-0-976d9a6bebe7@mainlining.org>
 <20260308-fillmore-clks-v1-3-976d9a6bebe7@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260308-fillmore-clks-v1-3-976d9a6bebe7@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H7fWAuYi c=1 sm=1 tr=0 ts=69b03578 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=OuZLqq7tAAAA:8 a=3zzezIjtfV0i2P62deAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: FOTjOcgoUDzdAl7TC509fA6Rf-XKdFj4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEzMiBTYWx0ZWRfX0mVY1arb3+bF
 jr++fIrc23ZyysUN5IFbw63bTshiAQhtz1jEVS2Ba5mx9rd77XYjxlpB/kPQoeM07qr1RjDxvNP
 P4kFNBmnudIr29UPehSg8kfYxfH8IF8m3TcD05wDIJ5S5xmiar74OKn2DFbgco1Riv4C/xYLrgf
 B8Sh9FbLnVjDQnqczEmPyuReVqRoQmQ4c903kqc6SJGH1NYby7q5ZaEuFQcyzJWjFTJ0JrMlGCE
 tMXXxBHkpmMZY1rriFFKn4m/T+RIJ5oxwAFAVh7i8PBT/1K+kbCIxSuyQIbJna5IUMis4+QcFwz
 ymVFeY5obnD1KS7u6P9w/HT5TvaBcsTXnD3iOLZy903ssDIp9LAK5bIjvhiDvF158UOOjg+snWD
 i/mWWjwfENpCiJRbT4Dkpe/+VygZMBYUMgGAWp6oK9mg8lVblpQN4nUqlTsgm+1cFBhSrEolaUt
 jbicaHS5XgDJq+uF+jA==
X-Proofpoint-ORIG-GUID: FOTjOcgoUDzdAl7TC509fA6Rf-XKdFj4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_03,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100132

On 3/8/26 1:39 AM, Aelin Reidel wrote:
> Add support for the global clock controller found on Fillmore (e.g. SM7450)
> based devices.
> 
> Signed-off-by: Aelin Reidel <aelin@mainlining.org>
> ---

[...]

> +static struct clk_regmap_mux gcc_pcie_0_pipe_clk_src = {

This one's a clk_regmap_phy_mux (see other clk drivers for what to
change)

[...]

> +static struct clk_regmap_mux gcc_usb3_prim_phy_pipe_clk_src = {

likewise

[...]

> +static const struct freq_tbl ftbl_gcc_sdcc2_apps_clk_src[] = {
> +	F(400000, P_BI_TCXO, 12, 1, 4),
> +	F(25000000, P_GCC_GPLL0_OUT_EVEN, 12, 0, 0),
> +	F(50000000, P_GCC_GPLL0_OUT_EVEN, 6, 0, 0),
> +	F(100000000, P_GCC_GPLL0_OUT_EVEN, 3, 0, 0),
> +	F(202000000, P_GCC_GPLL9_OUT_MAIN, 4, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
> +	.cmd_rcgr = 0x24014,
> +	.mnd_width = 8,
> +	.hid_width = 5,
> +	.parent_map = gcc_parent_map_5,
> +	.freq_tbl = ftbl_gcc_sdcc2_apps_clk_src,
> +	.clkr.hw.init = &(struct clk_init_data){
> +		.name = "gcc_sdcc2_apps_clk_src",
> +		.parent_data = gcc_parent_data_5,
> +		.num_parents = ARRAY_SIZE(gcc_parent_data_5),

.flags = CLK_OPS_PARENT_ENABLE,

> +		.ops = &clk_rcg2_ops,

&clk_rcg2_shared_floor_ops

[...]

> +static struct clk_rcg2 gcc_ufs_phy_axi_clk_src = {
> +	.cmd_rcgr = 0x8702c,
> +	.mnd_width = 8,
> +	.hid_width = 5,
> +	.parent_map = gcc_parent_map_10,
> +	.freq_tbl = ftbl_gcc_ufs_phy_axi_clk_src,
> +	.clkr.hw.init = &(struct clk_init_data){
> +		.name = "gcc_ufs_phy_axi_clk_src",
> +		.parent_data = gcc_parent_data_10,
> +		.num_parents = ARRAY_SIZE(gcc_parent_data_10),
> +		.ops = &clk_rcg2_ops,
> +	},
> +};

please check for .enable_safe_parent or something like that in the downstream
driver - for all RCGs that have it, use clk_rcg2_shared_ops

[...]

> +static struct gdsc pcie_0_gdsc = {
> +	.gdscr = 0x7b004,
> +	.pd = {
> +		.name = "pcie_0_gdsc",
> +	},
> +	.pwrsts = PWRSTS_RET_ON,
> +};
> +
> +static struct gdsc ufs_phy_gdsc = {
> +	.gdscr = 0x87004,
> +	.pd = {
> +		.name = "ufs_phy_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +};
> +
> +static struct gdsc usb30_prim_gdsc = {
> +	.gdscr = 0x49004,
> +	.pd = {
> +		.name = "usb30_prim_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +};

Your downstream DT also has:

HLOS1_VOTE_MMNOC_MMU_TBU_HF[0123]
_SF[01]
_TBU[01]

that all need to be defined and have .flags = VOTABLE

Konrad

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43409306B31
	for <phone-devel@vger.kernel.org>; Fri,  5 Dec 2025 10:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764928893; cv=none; b=jMOaXCQxOVT0xtA8X0rsRva5N2zEQstjk4FxB5r3meeo0BHXvbfPaKL2BHxNwEUGGohFkukyQUk/Q7wsHBOtCwQ/yEBVaoJK1X889mC4hzikTiW96boIvn1eAQGDaA2W9nY2TMJgxP78WkIkJj9d2N1790wT6pVOYVj5ioXf5jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764928893; c=relaxed/simple;
	bh=1UfligJQHsBEf/oWTPoxlgLQvvDW/tlYGi3/ZN3SZds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OgX8HsUPRdlYpkcVFukhFcWdQyL0DRYJWJCsRUJ88UjNkiOvA3UhikxSi5jZ+Bdsl+wvwuU9H/YsMalUiqbIxZ/QmRMcGoXAKgmhFhkKxaap95pXFaXwyERgjblB/IBr9UpVR02nc+YuBzvQYNFcMpJsqS4aEXu3noi71sifTgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lWH1PLfQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HAOznVks; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lWH1PLfQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HAOznVks"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B586pfD2516877
	for <phone-devel@vger.kernel.org>; Fri, 5 Dec 2025 10:01:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oeP/m2fJagJh7n1ezuCSp5/oRqR7bYSQxaqZUom0L6E=; b=lWH1PLfQW/wBOKj/
	KmfW/o8v++WoKd+IZB9jTgv5J+PYwc5XoNY2upqQHZWHIFsg7fZcyD6AaUbVarNf
	vn+r2OLxJ0tICRLQ/VAfJIMLDysHiDiP+PD8nLAp+xWz6co+fyRkBSs8n25WZ1rB
	WW9aQUNgenvB6pFZR9GUSTc32kMQ8UCGuiw7TFh8Avyq208mnrEpAp/GeI7YZWrL
	ImFFLub9/Tt1lSzZEd4iyF84Es1CGjyo/23eMLT6ZUhMvnfxNMyiK3/u1QaeuPWz
	QptHjo5241rwkZpGUt8p5b8VDCU6SeueDoNhViOnyaTy3SOvEmXfioo144yXkimr
	oUE+2A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4auj7n1r67-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 05 Dec 2025 10:01:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee07f794fcso4583041cf.2
        for <phone-devel@vger.kernel.org>; Fri, 05 Dec 2025 02:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764928881; x=1765533681; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oeP/m2fJagJh7n1ezuCSp5/oRqR7bYSQxaqZUom0L6E=;
        b=HAOznVkss/O6/Gjml7Osiev4gOL2QCOeyVWBuU0ub5uqsELvbe1Dlju/xnquj0MvhM
         HIs9l66sucESxLYQjsnzznMDOBVC7abMfIWD6uvfbdEQzs94zNW94w/hRq/cjyG7pLvp
         Xx8ovzrthcYShzw+npKT0J8IAG9wgC5UD8QKWl9emnYlxO4PYloSgLiWSM23Xm614TrO
         T0W2ZjxvsURq4Doic8ZzNhy1AXCb9S9DzjJbZZUSp2zc3MUe3U8Eqt1xvJi05dL8l5lD
         5N8DeBMywJEAbwtXUTIUIerrWmOgDpSvrQ2kvlsIkoo1sfJSCq9j4QyrUwjRkmKr3OAY
         MBmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764928881; x=1765533681;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oeP/m2fJagJh7n1ezuCSp5/oRqR7bYSQxaqZUom0L6E=;
        b=WHBHJ1A2QvjaxDvZVjGRVNUAjzsMoJVHS/e3/7Lk49D6xdDouCIJHvQm6cyb9x+1dA
         Oo/O/CI1MqFy7PPA8NnAjiq7MrSqCBxFuv5w8GKzP8JKnf5OPfIYMbDjQkciqwOxddPD
         FI1C7s5/lvNBufJ2DoCCSxyknQa8Z3bLh53037gIDzvEHosgLQDTyjQGJQMTQFwaR6EN
         g94Gkcx8X3UN23JApRWCeLdvMyi5U88ejSsQPAYRLIxgBloIiaLKQPFEbJvU86MyuouO
         6CgTjl2LHuEjZB9cHHWT2cRTonwvOPiln60ptoSqZmiUpgkFrYi6DRF5qBgs9n0BioHg
         tOjA==
X-Forwarded-Encrypted: i=1; AJvYcCUb0sIwUGobM/gfQd+E7PhDAEDjzwi+T+2Emk6BFXzUXewJUVkz/dEbJBLY7VYq7BPi3Bh5OI875jGOuw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx36pfoO1lEnd3Ga0m+xr7J1e610uBWIzk6HHUfi0JLD5pD8A9f
	/KsJbBDa/BWQtC7j4KrtKsuJ/1W68gomJVgTPhlg/L0kdNufGeauBktOre7E3YWfHFDuRBeOJha
	ghv6gtJlyRqlcSXEwVu/0w8ybkxSurU04bzGtAXqDXvCVTCWqXoXTLr0nEu0SG3XMiQ==
X-Gm-Gg: ASbGnct4cUhjeZk8KNLqIhvUtfgvTqKZEnO8/7bgQCD/lZZ84j4VexCXNHyghDRN62z
	yFSZZCOK5sDoX/j632thdm4Q2vohCuJE1izwtFuzKdPPD9ae2WBBRyvC6LtzRLOLJoWzTFYxqz6
	Qkrm1wNGJNl07ByS73QSb+Z8jDCj0TevrkwrWoUXOGpRgRF2UA0/DWpFgOhrLNHiJ+INNkd333y
	whY0KEgRORS9gegoS4Bz9cak4LFs9aAtspA5yrmISM4PSRgjPI1ABdmTH8zmviZSaeXQ8+TXnAu
	lq0A6pwELnBC+j/j3Ej7/4y9ShpW9cdncCrtGksjH44IXjnS8c6xZl080LdBsKGRRiFnJ0n+L7u
	snLYuOLzm+K9llDnHZLu5pYauh4HdnXkD5WiiZKDHDifC6t1eg6pW31b/wJjugcPMRQ==
X-Received: by 2002:ac8:5702:0:b0:4ee:4214:3226 with SMTP id d75a77b69052e-4f01b21e81dmr87142441cf.6.1764928881110;
        Fri, 05 Dec 2025 02:01:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFKshyoRtp9ZzsajxtgrEuEZW1LKNnO0PjqbOpSQZBzXPV/Xv7fWXBN10MdVp54WsP1yl7acg==
X-Received: by 2002:ac8:5702:0:b0:4ee:4214:3226 with SMTP id d75a77b69052e-4f01b21e81dmr87142021cf.6.1764928880561;
        Fri, 05 Dec 2025 02:01:20 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b2edf5a7sm3383939a12.13.2025.12.05.02.01.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 02:01:19 -0800 (PST)
Message-ID: <e0c5f40f-9bb2-4e62-b057-772dd3d6806a@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 11:01:17 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v2 7/8] media: qcom: camss: csiphy-3ph: C-PHY needs
 own lane configuration
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Petr Hodina <phodina@protonmail.com>,
        Casey Connolly <casey.connolly@linaro.org>,
        "Dr. Git" <drgitx@gmail.com>
Cc: Joel Selvaraj <foss@joelselvaraj.com>,
        Kieran Bingham <kbingham@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20251204-qcom-cphy-v2-0-6b35ef8b071e@ixit.cz>
 <20251204-qcom-cphy-v2-7-6b35ef8b071e@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251204-qcom-cphy-v2-7-6b35ef8b071e@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DOSCIiNb c=1 sm=1 tr=0 ts=6932ad71 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=5e6XgBO0iodNXUd1Y8AA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: TYvUAPrmtvCGFvQxExm_aqjis-sAclok
X-Proofpoint-GUID: TYvUAPrmtvCGFvQxExm_aqjis-sAclok
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA3MyBTYWx0ZWRfXyrU7quFtiZBP
 FNgcfTFoWmixGDAL2S5TDAFL9FY68VRa3u687gUnA7rXCMUqEtpeI6HWXav+80ggFhCVyP3YS7b
 G1E2yqG+kd+t0/5njBqGq2sSK/bn1anD0sBIsBXJAmxX7O0DLSuHSJZoGk5WNztsiwbbITXUs4Z
 H74BylNrkaVlePOUlDWlveioS91Xnzhiq7XI4fQyxBNG2CB8oM+OtIh98NdrgyG3cB3caQw3vtT
 E36ZCllzjx+AlMMYte0lU2HtTjUvyWEz7ZdQU4TeM3NJaNK6zEF5jNdgXxlB/fsPIi4LdmsxOxj
 IkF/hTMnKQziiVNssYqa1rU1ljze1VZQLW4YmsJqUn9vXDH1JJ/PzuWfo/rCCNyV/MQrEAPpEtm
 DPPPUQArmsnREy0fP4rFqq2USVtQ6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_03,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512050073

On 12/4/25 5:32 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Make sure we have proper lane registers definition in-place for each
> generation, otherwise C-PHY won't work.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

>  .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 48 ++++++++++++++++------
>  1 file changed, 36 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index 6d6dd54c5ac9c..c957f7dbfb243 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -1222,8 +1222,12 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>  		}
>  		break;
>  	case CAMSS_2290:
> -		regs->lane_regs = &lane_regs_qcm2290[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_qcm2290);
> +		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
> +			dev_err(dev, "Missing lane_regs definition for %d\n", c->phy_cfg);
> +		} else { /* V4L2_MBUS_CSI2_DPHY */

If you're checking for C-PHY specifically then just say it in writing
instead of printing a magic integer

Konrad

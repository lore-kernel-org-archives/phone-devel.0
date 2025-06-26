Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F1C2EF9B5
	for <phone-devel@vger.kernel.org>; Thu, 26 Jun 2025 19:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750965635; cv=none; b=AV/mPqBVADgbxB8UeLH0PYyStqQGLuEZ7rpjWSu8INBeaf/Ddfc3LnnaUJRRwQJ3BMfeQwPfO2tI8Iha8Cv3W6Xyablk6e6zwOvrYivcM/tJu/WdM2TpJ2MHUI05yWX4Zkj4yvPCvX2oweyXYVKghtwpNC0KHQboesFp+04RFxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750965635; c=relaxed/simple;
	bh=5r6q7+0wAzu943Z2jyQlPtPeKr7oOGYM95kHKprWAYg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MsvrUTP6fL9bNsrSU5Gek2ApdzrItw5PjAV7fyPhFcqRjQJsKQkgfRYMrlbMlVI9J3D8ZTivquPuWUSyPk4/nZ0ZkgwYM1BBkth4dIz+PqYeWgxIkce4+dsxfN8reCC745h3BZbLjCnQ/Q0M8+HuYf2ZPfpCefteWrcGQLnR1oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WRwBVy/B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WRwBVy/B"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QJ7BWA030208
	for <phone-devel@vger.kernel.org>; Thu, 26 Jun 2025 19:20:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0zOww6azj3OZ8n4+GX4w7Xx36kLdO3U5ZZUI4FQRwdg=; b=WRwBVy/BtSis8QCO
	+/YTVUH4/AFeUJ6+bhVkZHelz1uZGyqE4xdOZPVNtH8jZmnVxa5jGJcxnCWamE+7
	HBd++lNOOkubJ+YLzLbZcMWIdzkPpq7QPqFRvvPJVwh6BYgZrNuM2xle0Z8tun1C
	yvsn+g5n3fjdpFdpQPTHsxFXBNTsVLhq08jQCrcsrpUjc8vFIWlDVP2arWcJZpBK
	pptfx20PTEbhP45gUMvi6QsCL+wT7YrhHLesFWt3+MJpaGZIb54m1Qe4WmD05oRS
	doqv2ikFoLKbJMvDoRnPaxogFK3s/yDNGGZPAZ3ZcdSOMdOtOv/mivXnwLy4Fb6v
	11zcVQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47esa4wpbk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 26 Jun 2025 19:20:33 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a58580a76eso611631cf.0
        for <phone-devel@vger.kernel.org>; Thu, 26 Jun 2025 12:20:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750965632; x=1751570432;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0zOww6azj3OZ8n4+GX4w7Xx36kLdO3U5ZZUI4FQRwdg=;
        b=JPfqBo/+lLQRcIT6q7OxANuMI1yTMCI58g0PKC5wpBtwvPgwF7tNwY/yg/0mPKmi4Z
         NU00EqhCRw45xqUwyIhmW8Kz8wImdf5yBfbZg5hMXurzYavVioTF6f7QhkRlYH2Cq7fH
         Xq0KqInDCnad0oCF5Q4sfKyzpGdT2ovqe7+veUYPu1HRm7zflCru/GagV5USRcZP1z5e
         RBgnGAHbk99klFhgAgiFaYeq4Y9KAcYtGmKlgTAmDRtO2xdo6mOnG00r/5DqbdKnoJOC
         lUhNWlLiLnE1yBNl+RWAR3L9dfAiz7X5Co3Y2q3zscMhs2sjgKimiFECveLxG6/mr4hM
         gCCw==
X-Forwarded-Encrypted: i=1; AJvYcCUieeWQDCsDJydAtOgS4rzKklBdFoaVAoVYWPrPkwaKXHEM8LDDUMOpMR2hOvGQgY27iBnJwef5kGuzYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzbD+yJD6csQyJgL75+dkjE/1X4H1o07oGWrp94yBNi/2Sk7QU
	zJYmcRObocI+92RTbv3x7DEtf9pXOYI2qtv9r9BQpjQW8hcE42PDk/EtbzvYAznElDHp9ebPQaV
	gcO18X5CHZYHSEdv5OkC7yuEl+qeQRnwh935UeGBbpTwCFG0yQl7akLfHqa8+qxwEuw==
X-Gm-Gg: ASbGncuIXDxo1szszbzLTpwiXstlLRYGW1WULWuaB0nJoTKja9h9q9SaTgy21eI6nP1
	vXdfRcUg0UngjM0CvH0m96WcrtUDoDyFOTYU6//cVY59qhn5p9O33QxH5uMsZzoh4zh90yF5TCf
	SSVG+llzibPnM34yjADKkCdFz/zZ+6H8s+i6a/GWx6ZW5hXje3AZJ9/T71xbffJXPbsTTrpNYle
	RzwkhS10Rgs5xA8yLZQsFiGtCYn8vHq5Fad2ZBfexkrkfH0no01m3GG6MWUYN1ZYPo4Aq9v0ZfD
	7ZuR9aVNUA7ClawEHTyPFZ86HxyfAVopngsYEzjowdE6q1J8h2ykCgPshcpX08nt1ty7uFTMwqR
	hbBM=
X-Received: by 2002:a05:622a:178d:b0:475:820:9f6f with SMTP id d75a77b69052e-4a7fcab375amr4100651cf.9.1750965631713;
        Thu, 26 Jun 2025 12:20:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpEZc+VDoThophGjf8eCV3b76cou4xRyhNwgBBJqRGzQLg/M6WUxJq4j+uB+jHeRoCTB1C6Q==
X-Received: by 2002:a05:622a:178d:b0:475:820:9f6f with SMTP id d75a77b69052e-4a7fcab375amr4100491cf.9.1750965631159;
        Thu, 26 Jun 2025 12:20:31 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae2140d91aasm44338966b.64.2025.06.26.12.20.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 12:20:30 -0700 (PDT)
Message-ID: <3dd39700-4fa7-44e6-8893-b46c601d772c@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 21:20:28 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] remoteproc: qcom: pas: Add SM7635 remoteproc support
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250625-sm7635-remoteprocs-v1-0-730d6b5171ee@fairphone.com>
 <20250625-sm7635-remoteprocs-v1-3-730d6b5171ee@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625-sm7635-remoteprocs-v1-3-730d6b5171ee@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eLYTjGp1 c=1 sm=1 tr=0 ts=685d9d81 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=qm_u-Z9MdHEKZBNG23gA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: D40kcFbfZSxM2XW1IszBnS92RbGupAU3
X-Proofpoint-ORIG-GUID: D40kcFbfZSxM2XW1IszBnS92RbGupAU3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDE2NSBTYWx0ZWRfX2ZSbyzC7hjXH
 IQstZkbE+nJYFusqueHlhXfuKTeV1NiRi7GQFWDMSqn2EErtbNhpZ/+M+58TVSqXBaS9nYHOljJ
 S0ccBnEkRGM7mq9s6YARis2B8pmL0VyU+cgHyopLijrrDFONCTlW/WRLA/MB14LnD1N+9gf10ep
 bk2gl7+6/AomqDL8r5ofTp9dLTlXgQPKhMdlmxwUWJu8nc5UkMwNuT94klSCIPfdFFhXlflCPds
 flbhIzZzMnU/wzZEuOOYPd7cIvtFcdVyvRxsVsMuv+ppe//gFnDiOqk5pWnGVebuqp2DV4rbs2c
 LuYASoFy8hFanUpbsCX7SzfXohum+fZg/zbZWIDDaMInAYIxeRuzm3Ya6u1+1i5tc5UGgiye93i
 ophwkseQOktaCEMfOrPf0GTuyr3DjUpH46594mk3rG4KnUqfzsQF6Igr7o5nIsMXDJR8Bl47
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506260165

On 6/25/25 11:15 AM, Luca Weiss wrote:
> Add the different remoteprocs found on SM7635: ADSP, CDSP, MPSS and
> WPSS.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index b306f223127c452f8f2d85aa0fc98db2d684feae..6aae61dea8d0dbb9cf3ce84b9dbebb77b5aa1d52 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -1261,6 +1261,26 @@ static const struct adsp_data sdx55_mpss_resource = {
>  	.ssctl_id = 0x22,
>  };
>  
> +static const struct adsp_data sm7635_cdsp_resource = {
> +	.crash_reason_smem = 601,
> +	.firmware_name = "cdsp.mdt",
> +	.dtb_firmware_name = "cdsp_dtb.mdt",

I wonder why we're not putting MBNs in here..

Konrad

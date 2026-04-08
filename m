Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C87B37C0FA
	for <phone-devel@vger.kernel.org>; Wed,  8 Apr 2026 23:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775692615; cv=none; b=N8nqVFWQuA2fgzHZsSQTzouF5FDsaGIoULTQkKhv3yowJtINz81HsYLYj6+UJCbI8AxhU+UO9yLsPvPo4cXjw0e96+8ikGXkp2Y5OxVRIR/rSbua/GEfw/6YAQl7iIb/vU6zZGEJ7zSShjVPwEceYj6KwRYT24YmfFUFYeEXVH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775692615; c=relaxed/simple;
	bh=dr6GJIR/Sk4c890b88gB2jAai013600UA4EyAUN10EU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=quajNoOwWQDJEOvNo8YnrrA8ssnnnSknH7wZ1BpUwG4PjSvXP3bnP3byGztRwRB2RVfT7GRoK6L+oCIq8HPBkKzSsZe0zZOLHDNVrPcudO8VfyLj/ioSlhOvmEy4DTGWPLfaWxGIngdfTlf4KxaiUneKMqAFccpVNze8f26XhAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T5Znmiow; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uuw6a3nU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T5Znmiow";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uuw6a3nU"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638NbhWN674820
	for <phone-devel@vger.kernel.org>; Wed, 8 Apr 2026 23:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qmJZs1lr4C0E/fyx8Dm8giF+
	ilmdDMzXxhoS6JFYuJg=; b=T5Znmiow8aV0pLtFY3M04bO3SGd752eNVXvZpbvT
	WxNPIFVr0nzhrI2htN6XTj4qQ7LpxHVZ+hf6fexlGVBQQcS6xi5p/6z7PN0a4J3G
	VqKM7D9WNdhUQPmEU9bqj7YuiVSEH6zO4XzpPU9MTyXdHk+hHFuJWjf3m1TEHi2t
	SUXxRsOiX7FI0qmZKQMiq6w/Eb8BvOd2Th0ZoNNhaBLzSHuTorRMeHsTZeMPEu42
	YBWP2rN2SPInSEXShSDWskOk91zEfAqfLQXJKatg7PqMvnF77He9wtFalEbqaOG3
	9sV2Fl18Q3YeTLj0qJq2U3NoxnKutRb+kIFHxkLBnUD/IA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddtbmsng0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 08 Apr 2026 23:56:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb706313beso25999585a.3
        for <phone-devel@vger.kernel.org>; Wed, 08 Apr 2026 16:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775692612; x=1776297412; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qmJZs1lr4C0E/fyx8Dm8giF+ilmdDMzXxhoS6JFYuJg=;
        b=Uuw6a3nUXQPUp2JR01kqp42MdnGijfSCeQYmHJvP+08pEu/eLoOZieNXWXo+/zWl90
         YisrBnLgIV90tyFs4/x4GQc1ITi50APmemXrjrDQ+XjD7yIW3xZDDZF2RwgGPZ/lbU42
         /XI8C7GxgZSSUBGjU3R3AZR5dzrTHcNnMvb8gZT8tAXMojqGTkVuqCDRwS8un52IWGkG
         ysiey3h/uFdnzE2BH+C6E7klxkPYNMLfPA1gqBZ8OJMXys2Jufa2uR4aEwoaED6qS1pV
         ecR6bbeQnU8fLy/gH6OfrLQEHx1F9BDlZ9LkL08GJZP2NINkn45rJ8L7DClv3HfSBRlg
         0Yvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775692612; x=1776297412;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qmJZs1lr4C0E/fyx8Dm8giF+ilmdDMzXxhoS6JFYuJg=;
        b=ipFEEGsz/ZyVLXB8RhfC8CJn6l4zrv4lmG4qfHWM5XDemRRaY4uSASICucQ91Kw29h
         AgcpcdGLO9/SImWNsySU6zuyK98+45dA1JNXD3hn4EuX+xlu4JdnUxFp5Q0pI9pCK06L
         JTKQzD0JXTu2+CoM7GHZacMHe0sBNYBMRLog2FPq+MO2ji22GLaBfkEEo9BZmXp4A1EL
         PfOPpqAYcS6pgWoMqw6D77NTpL9h+WRCaFpB0Yp0+pT63o5+pauka9hhgngJCiB7cCX0
         Jfqh80O4MvUILfE/k/gWTAdE2FAMecQmxzSdBANpqXLF7zAvBAAQKm18VVv5E3RF92gK
         JHjg==
X-Forwarded-Encrypted: i=1; AJvYcCWcuFmknWgpwUPrWl7H5sFtn+vUc0DnaAulHMf6tB0EqZsemq2WgQceZbnLNDqkvlrtwQzyFVrM8x5hWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz/Brq6wO8/lwA2m1c/VTDfcYYE+oBVatUcpJ4Z3HLl4eFaBuA
	F/tl/PeTdby0dM7g33u64Pbheax8XlPww5yO1LHIkR27TC37ipEeupRmvnhSG1m93BystyL+Spi
	bR9LJEqHue7YVOPkF6Xo9noR8vTPT/5qNDcPWRzhVZmYxZ7jYgzqPR3ij1CKsfER/jg==
X-Gm-Gg: AeBDieuDP+7GynHIV97YFVoKLeQl7gmHjl7bbjWxi5ZrdxBFJLdzLsrbv9dGOwH0Ox3
	jK0IrIz7uDM82eiYOMH9MQ4uMxD9nvKmLG+AH9QPZ2ErqhMBGeKH6miocDBmKNpN3iyyWzW2YnF
	k4sRTm9xXvNkGfb/F30XXyRf/r84s+SpCWQRe0WTaJmNX+cIE2phdZ4TqrzWWHBqTlnLnyS+ZyI
	15t5WWSZVn/4uimExA90VOvRuWFBWuQcugdgh+1Ac1d5jXcaOfUa/Y0WVV282cI5JVs3OsgKdrB
	euERGkv3rBGJe11W2ejFd1US57xmhKYNJkFIGqEnE6RBFim6pkIa/dgz9laOkz0AfoRmoLbw/wK
	7hutumU989wedFgJTQeGxMROPtKImH8MfVDyhJpEe0RyS6ItGPRMe2cP8Fd2N8ewY5HQFxee+6A
	UBNhr+dTeYPIpAu/zfeeHLDlvFGDumQrRh5uI=
X-Received: by 2002:ac8:5889:0:b0:50d:80ee:3962 with SMTP id d75a77b69052e-50d80ee3b4bmr270165981cf.17.1775692612247;
        Wed, 08 Apr 2026 16:56:52 -0700 (PDT)
X-Received: by 2002:ac8:5889:0:b0:50d:80ee:3962 with SMTP id d75a77b69052e-50d80ee3b4bmr270165691cf.17.1775692611794;
        Wed, 08 Apr 2026 16:56:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6c9517bsm4981220e87.15.2026.04.08.16.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 16:56:49 -0700 (PDT)
Date: Thu, 9 Apr 2026 02:56:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Petr Hodina <petr.hodina@protonmail.com>, linux-input@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 11/11] arm64: dts: qcom: sdm845-google: Add STM FTS
 touchscreen support
Message-ID: <fkov4nsg2ezs3t354t6llprxymx5jolqce3wxewqwzre7gn26t@lu5xtuliqq4b>
References: <20260409-stmfts5-v4-0-64fe62027db5@ixit.cz>
 <20260409-stmfts5-v4-11-64fe62027db5@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409-stmfts5-v4-11-64fe62027db5@ixit.cz>
X-Proofpoint-GUID: e2N7lkfnW2Q7UsGtmMMMx1kpqX8Q4HZo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDIyMCBTYWx0ZWRfX+vAxV9jmDhWr
 MDVrpH5PEYgIY78P2AwiiqF9LE84nUlxkberaXiGhs+ig+3ly98/jNLbcFfRnw56SpS2qZUujH8
 ka/qg+PTloQMStcXLbPGTbAJKChvoAtikReeiP/+LpgPl2UOmKkuWC7ptVIXIo9a01ebISv2mBN
 /8ZFKLzCC+D+M77IoPbUa2z7Du/wvBiFgLIegKTmRHodbC8DjWBDVI9olDtu1HsuRLzsZpciuAz
 uPaSWTnuSPqEARid0/aJY4Ki9UhzEE1g7c36+T6SL4VRMTWH9nqU0yheNSSiOvPuBrWS+X775b1
 5TlzoR0apTwg/fBpzM24UKrOlzvwlXJA/Vg6SIBDt+FYYrMI+1/L7Yx+Oyke47LaguVLLBJoRHZ
 nvcR0CoNurNtKb2hbjyiOagKgnlUt1HR6hxi5EM1lcy0LTerwPwSpVGs1wz+U6JT0H9wD8vbF7b
 YnLZ2kWxPlZDz0X/Zwg==
X-Authority-Analysis: v=2.4 cv=YM2vDxGx c=1 sm=1 tr=0 ts=69d6eb44 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=sfOm8-O8AAAA:8
 a=EUspDBNiAAAA:8 a=B6YNfTnrzVbQWA5GCYUA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-ORIG-GUID: e2N7lkfnW2Q7UsGtmMMMx1kpqX8Q4HZo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_06,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080220

On Thu, Apr 09, 2026 at 12:15:54AM +0200, David Heidelberg via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Basic touchscreen connected to second i2c bus.
> 
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Co-developed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts | 19 ++++++++++++++++++-
>  arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi  |  2 +-
>  2 files changed, 19 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

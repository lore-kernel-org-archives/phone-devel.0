Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9162989B5
	for <phone-devel@vger.kernel.org>; Wed,  1 Oct 2025 09:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759309297; cv=none; b=X5RQbJbcPJBeMojIAo+Txn+WjEcGFzaOkDqZllOY98PEFbEcmfs19wWWY6Egvl+/jus0azE76yCBqDVPgNW2Zy7SiSeXAXJ8woxC5G2RoAL4f2jvjKQBDXvTjpJAgpxzFupaZpuCvVGmTcoQyZfKysShmiQhpBA7b5WqGi7QEDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759309297; c=relaxed/simple;
	bh=dlajLtcAMxSk0NrozjS9CF0M15RGimUH1gNNnAg1huI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cvzMuOMcBrab1ewlJ0BCVEyWBPaiXuQ6pxXW9qQb742xWDpftXGzIcBY7rL9hMBrGHM/HNsudA5pFLNDEEq0yES3j1Ds8r/VqtNwhjAZEqwNiO0lq0o7NC0B7Sc7JEUIusukX0fxuHV6jDwKsfG3oFfyEMX0IIhMBZ7W3ktuL7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gSs/Fhrr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gSs/Fhrr"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ULj7bu015464
	for <phone-devel@vger.kernel.org>; Wed, 1 Oct 2025 09:01:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B42pLGH75pGjx/3inm5Dy5xji4vr0c5P39RfvM77Mi8=; b=gSs/FhrrepVTfPfO
	rrJQv6fw3OGskESs5DXaCijLP+v+YJwoJceHzDSVbZxNhYl8Qgx0qnt3J9BY5o0J
	OHRfhLiFnuPvxJTy7SurzjzFHD6/9uSlC2HdOY3CT/OyGiHkaXlnc5fhp1LeGbj/
	0hKdUlGca8b9qnR51NG0tDcpz6WuhKhWEC91YD5uik5UQbONhRiA1mMVPM7hTYaR
	eELunro5tlhROvAXtKQWfTX8F4P8oapwslYVqD2kaTfXhvQ+XZDQlqqI0mrFwWMB
	cbexr+CMuZoRe0VvYWSyp3Xkl9tEF+ULTT5Bcgmkd6pZjcruLc74PBUEYsyITJIf
	5TRBmg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6vr3xs6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 01 Oct 2025 09:01:34 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e231785cc3so7199341cf.1
        for <phone-devel@vger.kernel.org>; Wed, 01 Oct 2025 02:01:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759309293; x=1759914093;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B42pLGH75pGjx/3inm5Dy5xji4vr0c5P39RfvM77Mi8=;
        b=Nhhg7ToKSp0t93fG6T0pMphCs7EeM495/iSbUGUW7SOa7DvEfSBWb4rmLXkCDrAplx
         UpayxMtpOBn83eFRWc8BsuoaswpmublGJW4Ktm1xeqLcSBRmWTEA5ExVbIQcz36x9Fm7
         prFrtT12xpd4yyvawujq/6rIqrQhdDwLadSvm8MzurVo6b4kWDBbBu4CZiluVbbNpL2J
         JXIa2MEntD1Z70a4wI8AYNrSsWf/B0G0vKxCyjeoxyLzWz/uc+nLh5LQNyXu/54CMBDs
         pVp+/sS/0M5KUYSOfSrM7deLg6ViA6tJeMrTaB6q7B55xRhZfPKcLQA1iJ43NZYLgboK
         UQDA==
X-Forwarded-Encrypted: i=1; AJvYcCUXe1cY2V+FPSoJ6oFGe24aq0NPHI2I0LpCwuvLy0Z4KUUG7VcfmBOq6H4tcXekVe6BybPhySg/G7xWQg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxaQZkiNgKZdxkPOmJ+ZQC2mdtegnNNDvsF2q5iV6kYOdrop11A
	Rzu6x0mTO42hPfAl/CjaDB4/8otHuGfIqvDRXW90lDq/39hhrcc7lUtaWl4yHgHgTuUBNxqLFN7
	H/WoDDEs5Y4FZf/oQAsO4/dTfESmTUzgIBGE51peXB7Oc60WCwBUVl4KZWG+wdWOT3Q==
X-Gm-Gg: ASbGncu/USpMRhysftyxYylkfEFWzXalrC0JdAXi+2i8R5lmlI/Aow2gIKscqzPMW40
	mhRgMz6Zw8kzzu27SB/NfFgMCaYYmeeoNppXwElLmvMwj/3sxTQqx9jcNXw/jRkvR3gKrJT+Dyx
	v+VfyRhFX0hhlxPLdqDZgr2e0gIb1uIbY7hkwV/1Q40sn6JT7mGcLAg6sODAtuFca0i7ypUw2H7
	tBVLPGp0uzNcps7bHsnEJJ8AZ5J6QQ1IHX6jTloODbieoLzXxgxJJ7wyM4v/wZl9Um3qAe8r0GT
	uIC/gvYBK4BJc1HuV7bvOEXd/vvDVJ5OTT5jlrTYVSK73Mv9prrQzC+PONiJ1hSV6KVFhYEnAOE
	UO/l6XsRj/gw8elb0aIX8s/fg1/s=
X-Received: by 2002:a05:622a:11c7:b0:4b7:94ee:4fb2 with SMTP id d75a77b69052e-4e41c54729amr23669211cf.5.1759309293323;
        Wed, 01 Oct 2025 02:01:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFghnDnhD89xfq3NpxumOgiOvGyipA7QKcNPEFFvbSfXFdc2E0wmIKiKI+YIF9fBkkm1d+LAA==
X-Received: by 2002:a05:622a:11c7:b0:4b7:94ee:4fb2 with SMTP id d75a77b69052e-4e41c54729amr23668841cf.5.1759309292804;
        Wed, 01 Oct 2025 02:01:32 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63662dc0a3csm3035680a12.48.2025.10.01.02.01.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 02:01:32 -0700 (PDT)
Message-ID: <57774099-08f1-4ede-b992-19f220bf8059@oss.qualcomm.com>
Date: Wed, 1 Oct 2025 11:01:29 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/11] arm64: dts: qcom: sdm845-lg-common: Add leds
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
References: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
 <20250928-judyln-dts-v3-4-b14cf9e9a928@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250928-judyln-dts-v3-4-b14cf9e9a928@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: GAe06zWdPp-J8DzksH-2rvgl3mped8is
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxNyBTYWx0ZWRfX2CnAUBYkHFjz
 ebbQRNu+7z39bB1dUUN+pSyx1hEgywc5rFJGqvqZUEB8Z2057T2ebxybobxb3mfgIF4xV0w3e1x
 c2OMff4bE+cQdiuH0fEHInme+qLc5UQ7mSwBfgK2fjt67NhRb5DsqZyIKn6sJzb5vnOhuyGlYcM
 naDnhxGLysjYLmX5Oir0KtFyeX2UvNg9kqC+F05p6lGZBnQ06A9gbiM1VxOYJE/xZlgmCv10Als
 j/PRlgjmeNaCs4mOQ6cDfmqA+LLzHoC2xno2ofsUNG3RJIqKicfkNAEPG0eft9L6JtpS1B50oxU
 PtE8JBTqtV8hnDNi08o+itcZhTDNCVeRr46Pj1hx+6+D+mqfrS61xYImhnhdF1axhfzUwS0VnHF
 cRK/FLakajBJFczZOcep6c95k/qdjQ==
X-Authority-Analysis: v=2.4 cv=IeiKmGqa c=1 sm=1 tr=0 ts=68dcedee cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=sfOm8-O8AAAA:8 a=Gbw9aFdXAAAA:8
 a=kAMZL_UcEcdRErClG6YA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=TvTJqdcANYtsRzA46cdi:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-ORIG-GUID: GAe06zWdPp-J8DzksH-2rvgl3mped8is
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_02,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270017

On 9/29/25 7:05 AM, Paul Sajna wrote:
> From: Amir Dahan <system64fumo@protonmail.com>
> 
> Add the multicolor status led in the phone's notch
> 
> Signed-off-by: Amir Dahan <system64fumo@protonmail.com>
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 28 ++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> index 4c631df56f262ba9e730f6720abd94d374b14692..2a612922ecf7ce3f8a0734cb1a31a8a81efdb4f2 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> @@ -6,6 +6,7 @@
>   */
>  
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  
> @@ -504,6 +505,33 @@ &pm8998_resin {
>  	status = "okay";
>  };
>  
> +&pmi8998_lpg {
> +	status = "okay";

Could you read back register 0xd000+0x45 (LED_SRC_SEL) on downstream
and make sure the value matches upstream?

A msm8998 kernel fork I have laying around on my computer always seems
to write '1' in there (which it claims corresponds to VPH_PWR as input)

Konrad
